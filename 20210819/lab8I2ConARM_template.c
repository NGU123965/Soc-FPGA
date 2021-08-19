//lab8I2ConARM_templat.c

//This is a recommended template for Lab #8
//lab8I2ConARM_???, where ??? is your name initial
//Summer 2021, HUST
//Lab #8 to read two tmp101 breakout boards from both PL and PS sides with ARM I2C modules
//Date: 1-14-2019
//separate I2C instance configuration and TMP101 configuration
//Revision to make the code more modular and portable

#include <stdio.h>
#include "xparameters.h"
#include <xiicps.h>

#define PS_I2C_DEVICE_ID XPAR_PS7_I2C_0_DEVICE_ID
#define PS_DATA_RATE 100000 // 100KHz
#define PS_TMP101_ADDRESS 0b1001001	//floating
#define PS_TMP101_RESOLUTION 0b01100000	//12 bit resolution for TMP101

#define PL_I2C_DEVICE_ID XPAR_PS7_I2C_1_DEVICE_ID
#define PL_DATA_RATE 200000 // 200KHz
#define PL_TMP101_ADDRESS 0b1001000	//ground
#define PL_TMP101_RESOLUTION 0b00100000	//10  bit resolution for TMP101

XIicPs i2c_ps,i2c_pl;	//device instances

#define DELAYLOOPCOUNT 80000000
//function prototype
int ReadTemperature(XIicPs * I2Cinstance, float * temperature, int I2C_address);

/*************************************************************
* This function ConfigureTMP101() configures an I2C TMP101 instance.
*
* @param	I2Cinstance is a pointer to an I2C instance.
* @param	I2CAddress is the address of I2C TMP101 chip.
* @param	TEMPresolution is .the resolution of TMP101 temperature as 0b0RR00000
*
* @return
*		- XST_SUCCESS if everything went well.
*		- XST_FAILURE if failed.
*
*************************************************************/

int ConfigureTMP101(XIicPs *I2Cinstance, u8 I2CAddress, u8 TEMPresolution) {
	u8 SetPointertoZero=0b00000000;
	u8 SetResolution[]={0b00000001,0b00000000};

	SetResolution[1]=TEMPresolution;

//Set resolution

//set pointer back to 0x00 to point to the temperature value

	return XST_SUCCESS;
} //end ConfigureTMP101()

/*************************************************************
* This function ConfigureI2Cinstance() configures an I2C instance.
*
* @param	I2Cinstance is a pointer to an I2C instance.
* @param	I2CdeviceID is the ID of I2C device defined in xparamenters.h.
* @param	I2C_ClockRate is clock frequency of I2C TMP101 in Hz.
*
* @return
*		- XST_SUCCESS if everything went well.
*		- XST_FAILURE if failed.
*
*************************************************************/
int ConfigureI2Cinstance(XIicPs *I2Cinstance, int I2CdeviceID, int I2C_ClockRate) {

	XIicPs_Config *I2C_config;
//Call lookup table to find I2C hardware module for I2CdeviceID
		I2C_config = XIicPs_LookupConfig(I2CdeviceID);
		if (NULL == I2C_config) {
			printf("\r\n-- Failed to find I2CdeviceID %d", I2CdeviceID);  	return XST_FAILURE;
		}
//Initialize I2C instance. Return XST_FAILTURE if failed.


//Self test. Return XST_FAILTURE if failed


//Set I2C clock frequency. Return XST_FAILTURE if failed


//Wait when I2Cdevice is busy until bus is idle to start another transfer



		return XST_SUCCESS;

} // end ConfigureI2Cinstance()

int main()
{
    float temp_ps, temp_pl;
    unsigned int loopcount;
    int status=XST_FAILURE;
    printf("\r\n\n -- Start Lab #8 I2C for TMP101 --\r\n");

//configure I2C instance and tmp101 board on PS port
    ConfigureI2Cinstance();
    if(status == XST_FAILURE) printf("\r\n Failed to configure I2C instance on PS.");
    ConfigureTMP101();
//configure I2C instance and tmp101 board on PL port
    ConfigureI2Cinstance();
    if(status == XST_FAILURE) printf("\r\n Failed to configure I2C instance on PL.");
    ConfigureTMP101();
	while(1) {
//Read tmp101 board and calculate temperature value on PS port
	status=ReadTemperature();
	if(status == XST_FAILURE) printf("\r\n Failed to read TMP101 from PS on bottom row of Connector JF.");

//Read tmp101 board and calculate temperature value on PL port
	status=ReadTemperature();
	if(status == XST_FAILURE) printf("\r\n Failed to read TMP101 from PL on top row of Connector JB.");

//printing floating numbers is not supported by xil_printf().
//Use printf() from <stdio.h> to print floating points.
//Mixing Xil_printf() with printf() may cause some printf() being dropped.
//Display temperature in floating point number with 4 digits after decimal point
		printf("\n\r");


//delay loop to pause for a while
		for(loopcount=0; loopcount<DELAYLOOPCOUNT; loopcount++);	//delay time

} //while(1)
    while(1);	// hold just in case
}	//end main()

/************************************************************
* This function ReadTemperature() reads temperature of an TMP101.
*
* @param	I2Cinstance is a pointer to an I2C instance.
* @param	temperature is the returned floaing point temperature value.
* @param	I2C_address is the address of I2C TMP101 chip.
*
* @return
*		- XST_SUCCESS if everything went well.
*		- XST_FAILURE if failed.
*
************************************************************/
int ReadTemperature(XIicPs * I2Cinstance, float * temperature, int I2C_address) {
	u8 temp[2];	//2 byte temperature
	u8 SetPointertoZero=0b00000000;
//set pointer back to 0x00 to point to the temperature value


//Read temperature. Return XST_FAILURE if failed


//Convert temperature to floating number


		return XST_SUCCESS;
}	//end of ReadTemperature()
