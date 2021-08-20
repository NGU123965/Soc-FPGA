/**
* @file xiicps_polled_master_example.c
*
* A design example of using the device in polled mode as master.
*
* The example uses buffer size 132. Please set the send buffer of the
* Aardvark device to be continuous 64 bytes from 0x00 to 0x3F.
 *
 * <pre> MODIFICATION HISTORY:
 *
 * Ver   Who Date     Changes
 * ----- --- -------- -----------------------------------------------
 * 1.00a jz  01/30/10 First release
 *
 * </pre>
 *
 *****************************************************/

/***************************** Include Files *************/
#include "xparameters.h"
#include "xiicps.h"
#include "xil_printf.h"

/************************** Constant Definitions **********/

/*
 * The following constants map to the XPAR parameters created in the
 * xparameters.h file. They are defined here such that a user can easily
 * change all the needed parameters in one place.
 */
#define IIC_DEVICE_PS_ID        XPAR_XIICPS_0_DEVICE_ID
#define IIC_DEVICE_PL_ID        XPAR_XIICPS_1_DEVICE_ID

/*
 * The slave address to send to and receive from.
 */
#define IIC_PS_ADDR     0x49
#define IIC_PL_ADDR     0x49
#define IIC_SCLK_RATE       100000

/*A
 * The following constant controls the length of the buffers to be sent
 * and received with the IIC.
 */
#define TEST_BUFFER_SIZE    2

/**************************** Type Definitions *************/

/************************** Function Prototypes ***************/

int IicPsMasterPolledExample(u16 DeviceId, u16 IIC_ADDR);
/************************** Variable Definitions ***************/

XIicPs Iic;     /**< Instance of the IIC Device */
//XlicPs Iic2;

/*
 * The following buffers are used in this example to send and 
 *  receive data with the IIC. 
*/
u8 SendBuffer[TEST_BUFFER_SIZE];  /**< Buffer for Transmitting Data */
u8 RecvBuffer[TEST_BUFFER_SIZE];  /**< Buffer for Receiving Data */
float Temp1, Temp2;
/*******************************************************************
/**
* Main function to call the polled master example.
*
* @param    None.
*
* @return   XST_SUCCESS if successful, XST_FAILURE if unsuccessful.
*
* @note     None.
*
*****************************************************************/
int main(void)
{
    while(1) {
    int Status;

//  xil_printf("IIC Master Polled Example Test \r\n");
//  xil_printf("Xi test \r\n");

    /*
     * Run the Iic polled example in master mode, specify the Device
     * ID that is specified in xparameters.h.
     */

    xil_printf("\n Read TMP101 Device on PS F = ");
        Status = IicPsMasterPolledExample(IIC_DEVICE_PS_ID, IIC_PS_ADDR);
        if (Status != XST_SUCCESS) {
            xil_printf("IIC Master Polled Failed1\r\n");
            return XST_FAILURE;
        }

    xil_printf("\n Read TMP101 Device on PL B = ");
        Status = IicPsMasterPolledExample(IIC_DEVICE_PL_ID, IIC_PL_ADDR);
        if (Status != XST_SUCCESS) {
            xil_printf("IIC Master Polled Failed2\r\n");
            return XST_FAILURE;
        }



    }

    //xil_printf("Successfully ran IIC Master Polled Example Test\r\n");
    return XST_SUCCESS;
}

/**********************************************************
* This function sends data and expects to receive data from 
* slave as modular of 64.
*
* This function uses interrupt-driven mode of the device.
*
* @param    DeviceId is the Device ID of the IicPs Device and is the
*       XPAR_<IICPS_instance>_DEVICE_ID value from xparameters.h
*
* @return   XST_SUCCESS if successful, otherwise XST_FAILURE.
*
* @note     None.
*
************************************************************/
int IicPsMasterPolledExample(u16 DeviceId, u16 IIC_ADDR)
{
    int Status;
    XIicPs_Config *Config;
    int Index;

    /*
     * Initialize the IIC driver so that it's ready to use
     * Look up the configuration in the config table,
     * then initialize it.
     */
//  xil_printf("initial iic \r\n");

//  xil_printf("get Config \r\n");
    Config = XIicPs_LookupConfig(DeviceId);
    if (NULL == Config) {
        return XST_FAILURE;
    }

//  xil_printf("get status \r\n");
    Status = XIicPs_CfgInitialize(&Iic, Config, Config->BaseAddress);
    if (Status != XST_SUCCESS) {
        return XST_FAILURE;
    }
/* Perform a self-test to ensure that the hardware was built correctly. */
//  xil_printf("get self test status \r\n");
    Status = XIicPs_SelfTest(&Iic);
    if (Status != XST_SUCCESS) {
        return XST_FAILURE;
    }

    /*
     * Set the IIC serial clock rate.
     */
//  xil_printf("set clock \r\n");
    XIicPs_SetSClk(&Iic, IIC_SCLK_RATE);

/* Initialize the send buffer bytes with a pattern to send and the
 * the receive buffer bytes to zero to allow the receive data to be
 * verified. */
    for (Index = 0; Index < TEST_BUFFER_SIZE; Index++) {
        SendBuffer[Index] = 0;
        RecvBuffer[Index] = 0;
    }

/*Send the buffer using the IIC and ignore the number of bytes sent
 * as the return value since we are using it in interrupt mode. */
//  xil_printf("get MasterSendPolled status1 \r\n");
    Status = XIicPs_MasterSendPolled(&Iic, SendBuffer,
             TEST_BUFFER_SIZE, IIC_ADDR);

    if (Status != XST_SUCCESS) {
        xil_printf("nm$l \r\n");
        return XST_FAILURE;
    }


/* Wait until bus is idle to start another transfer. */
    while (XIicPs_BusIsBusy(&Iic)) {
        /* NOP */
        xil_printf("loop util iic is not busy \r\n");
    }

//  xil_printf("get MasterSendPolled status2 \r\n");
    Status = XIicPs_MasterRecvPolled(&Iic, RecvBuffer,
              TEST_BUFFER_SIZE, IIC_ADDR);
    if (Status != XST_SUCCESS) {
        return XST_FAILURE;
    }
    float Temp = (float) RecvBuffer[0] + (float) (RecvBuffer[1] >> 8);
    printf(" %8.4f  C degrees \n", Temp);

    return XST_SUCCESS;
}