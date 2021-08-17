/* interrupt_counter_tut_2D_new.c */
//interrupt_counter_tut_2D_new.c
// Revised from interrupt_counter_tut_2D.c
// By Jianjian Song, January 2020
//for ECE530 Rose-Hulman institute of Technology
//to indicate three Levels of interrupt configuration
//Level 1: For A9 Core with subroutines in xil_exception.h
//Level 2: for Generic Interrupt Controller (GIC) with subroutines in xscugic.h
//Level 3: for a specific peripheral or local device:
//	- xgpio.h for GPIO interrupt
//  - xtnrctr.h for AXI Timer interrupt
/* Created on: 	Unknown
 *  Author: 	Ross Elliot
 *  Version:		1.1  */
/***************************
* VERSION HISTORY
* 	v2.0 - 01/06/2020 by Jianjian Song
* 		Revised with a number of calls and remove all warnings.
* 	v1.1 - 01/05/2015
* 		Updated for Zybo ~ DN
*	v1.0 - Unknown
*		First version created.
******************************************/
#include "xparameters.h"
#include "xgpio.h"
#include "xtmrctr.h"
#include "xscugic.h"
#include "xil_exception.h"
#include "xil_printf.h"

// Device ID and Interrupt ID definitions
#define INTC_DEVICE_ID 		XPAR_PS7_SCUGIC_0_DEVICE_ID
#define TMR_DEVICE_ID		XPAR_TMRCTR_0_DEVICE_ID
#define BTNS_DEVICE_ID		XPAR_AXI_GPIO_0_DEVICE_ID
#define LEDS_DEVICE_ID		XPAR_AXI_GPIO_1_DEVICE_ID
#define INTC_GPIO_INTERRUPT_ID 	XPAR_FABRIC_AXI_GPIO_0_IP2INTC_IRPT_INTR
#define INTC_TMR_INTERRUPT_ID 	XPAR_FABRIC_AXI_TIMER_0_INTERRUPT_INTR
#define BTN_INT_MASK 			XGPIO_IR_CH1_MASK
//Timer load value:  Count up timer (0xFFFFFFFF - 0xF8000000)=0x7FFFFFF=134217727
//134217727/100MHz = 134217727*10ns=1342177270ns = 1.34217727 (seconds)
#define TMR_LOAD			0xF8000000

//Four Device definitions
XGpio LEDInst, BTNInst;
XScuGic INTCInst;
XTmrCtr TMRInst;

//global variable
int led_data;

// Function Prototypes
static int SetupLEDs(XGpio *LEDdevice, int DeviceID);
static int SetupPushbuttons(XGpio *Pushbuttondevice, int DeviceID);
static void BTN_Intr_Handler(void *baseaddr_p);
static void TMR_Intr_Handler(void *baseaddr_p);
static int GICconfiguration(u16 DeviceId, XTmrCtr *TmrInstancePtr, XGpio *GpioInstancePtr);

void BTN_Intr_Handler(void *InstancePtr)
{
	int btn_value, led_data;	//local and temporary variables
	XGpio_InterruptDisable(&BTNInst, BTN_INT_MASK);
	// Ignore additional button presses
	if ((XGpio_InterruptGetStatus(&BTNInst) & BTN_INT_MASK) != BTN_INT_MASK) {  return;  }
	btn_value = XGpio_DiscreteRead(&BTNInst, 1);
	// Increment counter based on button value
	//button change on both edges will cause interrupt but only button value = 1 will be active.
	led_data = led_data + btn_value;
    XGpio_DiscreteWrite(&LEDInst, 1, led_data);
    XGpio_InterruptClear(&BTNInst, BTN_INT_MASK);
    XGpio_InterruptEnable(&BTNInst, BTN_INT_MASK);
} //end BTN_Intr_Handler()

//this code will NOT work as it was intended because the interrupt flag will not be cleared
//unless tmr_count==3. Therefore, this handler will be called three times for each interrupt
void TMR_Intr_Handler(void *data)
{
	static int tmr_count;	//local and perminent variable
	if (XTmrCtr_IsExpired(&TMRInst,0)){
// Once timer has expired 3 times, stop, increment counter. Reset timer and start running again
		if(tmr_count == 3){
			XTmrCtr_Stop(&TMRInst,0);
			tmr_count = 0;
			led_data++;
			XGpio_DiscreteWrite(&LEDInst, 1, led_data);
			XTmrCtr_Reset(&TMRInst,0);
			XTmrCtr_Start(&TMRInst,0);
		}
		else tmr_count++;
	}
}	//end TMR_Intr_Handler

int SetupLEDs(XGpio *LEDdevice, int DeviceID) {
	int status;
	// Initialize LEDs
	  status = XGpio_Initialize(LEDdevice, DeviceID);
	  if(status != XST_SUCCESS) return XST_FAILURE;
	  // Set LEDs direction to outputs
	    XGpio_SetDataDirection(&LEDInst, 1, 0x00);
	    return XST_SUCCESS;
} //end SetupLEDs()

int SetupPushbuttons(XGpio *Pushbuttondevice, int DeviceID) {
	int status;
	// Initialize Push Buttons
	  status = XGpio_Initialize(Pushbuttondevice, DeviceID);
	  if(status != XST_SUCCESS) return XST_FAILURE;

	  // Set all buttons direction to inputs
	  XGpio_SetDataDirection(Pushbuttondevice, 1, 0xFF);
	  // Level 3: Enable GPIO interrupts interrupt - JJS
	  	XGpio_InterruptGlobalEnable(Pushbuttondevice);
	  //Level 3: channel 1 only
	  	XGpio_InterruptEnable(Pushbuttondevice, BTN_INT_MASK);
	  	return XST_SUCCESS;
} //end SetupPushbuttons()

int SetupTimer(XTmrCtr *Timerdevice, int DeviceID) {
	int status;
	  status = XTmrCtr_Initialize(Timerdevice, DeviceID);
	  if(status != XST_SUCCESS) return XST_FAILURE;
	  //Level 3: timer. There is a warning on type mismatch for the handler but the statement works.
	  XTmrCtr_SetHandler(Timerdevice, (XTmrCtr_Handler) TMR_Intr_Handler, Timerdevice);
	  XTmrCtr_SetResetValue(Timerdevice, 0, TMR_LOAD);
	  XTmrCtr_SetOptions(Timerdevice, 0, XTC_INT_MODE_OPTION | XTC_AUTO_RELOAD_OPTION);
	  //Start timer
	  XTmrCtr_Start(Timerdevice, 0);
	  return XST_SUCCESS;
} //end SetupTimer()

//GIC Level 2 and Cortex A9 CPU Level 1configuration
int GICconfiguration(u16 DeviceId, XTmrCtr *TmrInstancePtr, XGpio *GpioInstancePtr)
{
	XScuGic_Config *IntcConfig;
	int status;
// Level 2: Generic Interrupt controller (GIC) initialization
	IntcConfig = XScuGic_LookupConfig(DeviceId);
	status = XScuGic_CfgInitialize(&INTCInst, IntcConfig, IntcConfig->CpuBaseAddress);
	if(status != XST_SUCCESS) return XST_FAILURE;
// Level 2: Connect GPIO interrupt to handler
	status = XScuGic_Connect(&INTCInst,
		INTC_GPIO_INTERRUPT_ID, (Xil_ExceptionHandler)BTN_Intr_Handler, (void *)GpioInstancePtr);
	if(status != XST_SUCCESS) return XST_FAILURE;
// Level 2: Connect timer interrupt to handler
	status = XScuGic_Connect(&INTCInst,
		 INTC_TMR_INTERRUPT_ID,
	 (Xil_ExceptionHandler)TMR_Intr_Handler,(void *)TmrInstancePtr);
	if(status != XST_SUCCESS) return XST_FAILURE;
	// Level 2: Enable GPIO and timer interrupts in the controller - JJS
	XScuGic_Enable(&INTCInst, INTC_GPIO_INTERRUPT_ID);
	XScuGic_Enable(&INTCInst, INTC_TMR_INTERRUPT_ID);
//Level 1: to assign GIC handler to IRQ vector of Cortex A9 CPU
		Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler)XScuGic_InterruptHandler, &INTCInst);
		Xil_ExceptionEnable();	//this will enable IRQ interrupt
	return XST_SUCCESS;
} //end GICconfiguration()

int main (void)
{
  int status;
  // Initialize LEDs
  status = SetupLEDs(&LEDInst, LEDS_DEVICE_ID);
  if(status != XST_SUCCESS) return XST_FAILURE;

  // Initialize Push Buttons
  status = SetupPushbuttons(&BTNInst, BTNS_DEVICE_ID);
  if(status != XST_SUCCESS) return XST_FAILURE;

  // initialize timer
  status = SetupTimer(&TMRInst, TMR_DEVICE_ID);
  if(status != XST_SUCCESS) return XST_FAILURE;

  // Level 1 and 2: Initialize generic interrupt controller GIC and Cortex A9
  status = GICconfiguration(INTC_DEVICE_ID, &TMRInst, &BTNInst);
  if(status != XST_SUCCESS) return XST_FAILURE;
  while(1);	//idle forever
  return 0;
} //end main()
