/******************************************************************************
* Copyright (C) 2008 - 2023 Xilinx, Inc.  All rights reserved.
* Copyright (c) 2022 - 2023 Advanced Micro Devices, Inc. All Rights Reserved.
* SPDX-License-Identifier: MIT
******************************************************************************/

/*****************************************************************************/
/**
* @file xspi_slave_polled_example.c
*
* This file contains a design example using the Spi driver (XSpi) and the SPI
* device as a Slave, in polled mode.
*
* This example fills the Spi Tx buffer with the number of data bytes it expects
* to receive from the master and then Spi device waits for an external master to
* initiate the transfer. When the master initiates the transfer, the Spi device
* receives data from the master and simultaneously sends the data in Tx buffer
* to the master. Once the transfer is complete, this example prints the data
* received from the master. The number of bytes to be received by the Spi slave
* is defined by the constant BUFFER_SIZE in this file.
*
* The external SPI devices that are present on the Xilinx boards don't support
* the Master functionality. This example has been tested with an off board
* external SPI Master device and the Xilinx SPI device configured as a Slave.
* This example has been tested for byte-wide SPI transfers.
*
* @note
*
* This example assumes that there is a STDIO device in the system.
*
*<pre>
* MODIFICATION HISTORY:
*
* Ver   Who  Date     Changes
* ----- ---- -------- ---------------------------------------------------------
* 1.00a psk  09/05/08 First Release
* 3.00a ktn  10/28/09 Converted all register accesses to 32 bit access.
*		      Updated to use the HAL APIs/macros. Replaced call to
*		      XSpi_Initialize API with XSpi_LookupConfig and
*		      XSpi_CfgInitialize.
* 4.2   ms   01/23/17 Added xil_printf statement in main function to
*                     ensure that "Successfully ran" and "Failed" strings
*                     are available in all examples. This is a fix for
*                     CR-965028.
* 4.11  sb   07/11/23 Added support for system device-tree flow.
*
*</pre>
******************************************************************************/

/***************************** Include Files *********************************/

#include "xparameters.h"	/* XPAR parameters */
#include "xspi.h"		/* SPI device driver */
#include "stdio.h"
#include "xil_printf.h"
#include "mc_ctrl.h"
#include "sleep.h"
#include <xstatus.h>

/************************** Constant Definitions *****************************/

/*
 * The following constants map to the XPAR parameters created in the
 * xparameters.h file. They are defined here such that a user can easily
 * change all the needed parameters in one place.
 */
#ifndef SDT
#define SPI_DEVICE_ID		XPAR_SPI_0_DEVICE_ID
#endif

/*
 * This is the size of the buffer to be transmitted/received in this example.
 */
#define BUFFER_SIZE		4

/**************************** Type Definitions *******************************/


/***************** Macros (Inline Functions) Definitions *********************/


/************************** Function Prototypes ******************************/

#ifndef SDT
static int SpiSlavePolledExample(XSpi *SpiInstancePtr, u16 SpiDeviceId);
#else
static int SpiSlavePolledExample(XSpi *SpiInstancePtr, UINTPTR BaseAddress);
static int SpiInit(XSpi *SpiInstancePtr, UINTPTR BaseAddress);
#endif

/************************** Variable Definitions *****************************/

/*
 * The instances to support the device drivers are global such that they are
 * initialized to zero each time the program runs. They could be local but
 * should at least be static so that they are zeroed.
 */
static XSpi SpiInstance;   /* The instance of the SPI device */

/*
 * The following variables are used to read from the  Spi device, these are
 * global to avoid having large buffers on the stack.
 */
u8 ReadBuffer[BUFFER_SIZE];
u8 WriteBuffer[BUFFER_SIZE];

/*
 * The following variable allows a test value to be added to the values that
 * are sent in reflection to the Master transmission such that unique values can
 * be generated to guarantee the transfer from Slave to Master is successful.
 */
int Test;

/*****************************************************************************/
/**
*
* Main function to call the Spi Slave example in polled mode.
*
*
* @return	XST_SUCCESS if successful, otherwise XST_FAILURE.
*
* @note		None
*
******************************************************************************/
void* MC_CTRL_BaseAddress = (void*)(0x44A10000);

#define FW_VER_MAJOR 0
#define FW_VER_MINOR 1

#define SPI_MAX_BYTES_TRANSFERED 4

typedef enum {
    CONFIG,
    READ,
    WRITE,
    RESET,
    TEST
} cmd_t;

int mc_ctrl_reg_offset [] = {
    MC_CTRL_S00_AXI_SLV_REG1_OFFSET,
    MC_CTRL_S00_AXI_SLV_REG2_OFFSET
};



int main(void)
{
    xil_printf("Motion controller FW VER %d.%d\r\n", FW_VER_MAJOR, FW_VER_MINOR);

	int Status;

    MC_CTRL_Reg_SelfTest(MC_CTRL_BaseAddress);
    //MC_CTRL_mWriteReg(MC_CTRL_BaseAddress,MC_CTRL_S00_AXI_SLV_REG0_OFFSET,1 << 1);
    //sleep(1);
    //MC_CTRL_mWriteReg(MC_CTRL_BaseAddress,MC_CTRL_S00_AXI_SLV_REG0_OFFSET,0);
    //MC_CTRL_mWriteReg(MC_CTRL_BaseAddress,MC_CTRL_S00_AXI_SLV_REG1_OFFSET,0xFFF01234);
    //MC_CTRL_mWriteReg(MC_CTRL_BaseAddress,MC_CTRL_S00_AXI_SLV_REG2_OFFSET,0x20);
    // while(1){
    //     MC_CTRL_mWriteReg(MC_CTRL_BaseAddress,MC_CTRL_S00_AXI_SLV_REG1_OFFSET,0xFFFF1234);
    //     MC_CTRL_mWriteReg(MC_CTRL_BaseAddress,MC_CTRL_S00_AXI_SLV_REG2_OFFSET,0x20);

    //     //for(int i = 0; i < 10000; i++){volatile int temp = 1; temp++;}
    //     sleep(10);
    // }
    SpiInit(&SpiInstance, XPAR_XSPI_0_BASEADDR);


	//Status = SpiSlavePolledExample(&SpiInstance, XPAR_XSPI_0_BASEADDR);
    //if(Status != XST_SUCCESS) xil_printf("FAIL\r\n");

    int res = XST_SUCCESS; 
    while(res == XST_SUCCESS){
        res = XSpi_Transfer(&SpiInstance, WriteBuffer, ReadBuffer, SPI_MAX_BYTES_TRANSFERED);
        xil_printf("\r\nReceived data is:\r\n");
	    for(int Count = 0; Count < BUFFER_SIZE; Count++) {
		    xil_printf("0x%x \r\n", ReadBuffer[Count]);
	    }
        int cmd = ReadBuffer[0];
        xil_printf("SPI: %d\r\n", cmd);
        switch(cmd){
            case CONFIG: 
            {
                xil_printf("\r\nCMD:0x%x\r\n", cmd);
                MC_CTRL_mWriteReg(MC_CTRL_BaseAddress,MC_CTRL_S00_AXI_SLV_REG0_OFFSET,ReadBuffer[1] << 16 | ReadBuffer[2] << 8 | ReadBuffer[3]);
                //Set LED
                //Self test
                //Config clock
                break;
            }
            case READ: 
            {
                xil_printf("\r\nCMD:0x%x\r\n", cmd);
                break;

            }
            case WRITE:
            {
                int channel = ReadBuffer[1]; //0-7
                int reg = ReadBuffer[2]; // 0 - threshold, 1 - phase inc delta, 2- reset, 
                //int val = ReadBuffer[3];
                int val = 0xFFF00000;
                xil_printf("\r\nCMD:0x%x CH:0x%x R:0x%x Val:0x%x\r\n", cmd, channel, reg, val);
                //MC_CTRL_mWriteReg(MC_CTRL_BaseAddress,mc_ctrl_reg_offset[reg]+(channel-1)*4,val);
                MC_CTRL_mWriteReg(MC_CTRL_BaseAddress,mc_ctrl_reg_offset[reg],val);
                break;
            }
            case RESET: 
            {
                xil_printf("\r\nCMD:0x%x\r\n", cmd);
                MC_CTRL_mWriteReg(MC_CTRL_BaseAddress,MC_CTRL_S00_AXI_SLV_REG0_OFFSET,0xFF);
                MC_CTRL_mWriteReg(MC_CTRL_BaseAddress,MC_CTRL_S00_AXI_SLV_REG0_OFFSET,0);
                break;
            }
            case TEST:
            {
                xil_printf("\r\n will blink led\r\n");
                for(int i = 0; i < 10; i++){
                    MC_CTRL_mWriteReg(MC_CTRL_BaseAddress,MC_CTRL_S00_AXI_SLV_REG0_OFFSET,1 << 9);
                    sleep(2);
                    MC_CTRL_mWriteReg(MC_CTRL_BaseAddress,MC_CTRL_S00_AXI_SLV_REG0_OFFSET,0);
                }
                break;
            }
            default:
                break;
        }
    }
    
	return XST_SUCCESS;
}

// typedef enum {
//     CONFIG,
//     SET,
//     GET,
//     LAST_COMMAND
// } cmd_t;

// typedef enum {
//     THRESHOLD_REG,
//     PHASE_INC_DELTA_REG,
//     RESET
// } mc_ch_reg_t;


static int CommandReceive(XSpi *SpiInstancePtr,u8* CommandBuffer){


}

static int SpiInit(XSpi *SpiInstancePtr, UINTPTR BaseAddress)
{
	XSpi_Config *ConfigPtr;
	int Status;
	u32 Count;

	xil_printf("\r\nInit SPI...\r\n");

	/*
	 * Initialize the SPI driver so that it's ready to use, specify the
	 * device ID that is generated in xparameters.h.
	 */

	ConfigPtr = XSpi_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		return XST_FAILURE;
	}
	Status = XSpi_CfgInitialize(SpiInstancePtr, ConfigPtr,
				    ConfigPtr->BaseAddress);
	if (Status != XST_SUCCESS) {
        xil_printf("\r\nFAIL1\r\n");
		return XST_FAILURE;
	}

	/*
	 * The SPI device is a slave by default and the clock phase and polarity
	 * have to be set according to its master. In this example, CPOL is set
	 * to active low and CPHA is set to 1.
	 */
	Status = XSpi_SetOptions(SpiInstancePtr, XSP_CLK_PHASE_1_OPTION |
				 XSP_CLK_ACTIVE_LOW_OPTION);
	if (Status != XST_SUCCESS) {
        xil_printf("\r\nFAIL2\r\n");
		return XST_FAILURE;
	}

	/*
	 * Start the SPI driver so that the device is enabled.
	 */
	XSpi_Start(SpiInstancePtr);

	/*
	 * Disable Global interrupt to use polled mode operation.
	 */
	XSpi_IntrGlobalDisable(SpiInstancePtr);
    xil_printf("\r\nSUCCESS\r\n");
	return XST_SUCCESS;
}

/*****************************************************************************/
/**
*
* This function does a minimal test on the Spi device and driver as a design
* example. The purpose of this function is to illustrate the device slave
* functionality in polled mode. This function receives data from a master and
* prints the received data.
*
* @param	SpiInstancePtr is a pointer to the instance of Spi component.
*
* @param	SpiDeviceId is the Device ID of the Spi Device and is the
*		XPAR_<SPI_instance>_DEVICE_ID value from xparameters.h.
*
* @return	XST_SUCCESS if successful, otherwise XST_FAILURE.
*
* @note		This function contains an infinite loop such that if the Spi
*		device doesn't receive any data, it may never return.
*
******************************************************************************/
#ifndef SDT
int SpiSlavePolledExample(XSpi *SpiInstancePtr, u16 SpiDeviceId)
#else
static int SpiSlavePolledExample(XSpi *SpiInstancePtr, UINTPTR BaseAddress)
#endif
{
	XSpi_Config *ConfigPtr;
	int Status;
	u32 Count;

	xil_printf("\r\nEntering the Spi Slave Polled Example.\r\n");
	xil_printf("Waiting for data from SPI master\r\n");

	/*
	 * Initialize the SPI driver so that it's ready to use, specify the
	 * device ID that is generated in xparameters.h.
	 */
#ifndef SDT
	ConfigPtr = XSpi_LookupConfig(SpiDeviceId);
#else
	ConfigPtr = XSpi_LookupConfig(BaseAddress);
#endif
	if (ConfigPtr == NULL) {
        xil_printf("\r\nFAIL3\r\n");
		return XST_FAILURE;
	}
	Status = XSpi_CfgInitialize(SpiInstancePtr, ConfigPtr,
				    ConfigPtr->BaseAddress);
	if (Status != XST_SUCCESS) {
        xil_printf("\r\nFAIL4 %d\r\n", Status);
		return XST_FAILURE;
	}

	/*
	 * The SPI device is a slave by default and the clock phase and polarity
	 * have to be set according to its master. In this example, CPOL is set
	 * to active low and CPHA is set to 1.
	 */
	Status = XSpi_SetOptions(SpiInstancePtr, XSP_CLK_PHASE_1_OPTION |
				 XSP_CLK_ACTIVE_LOW_OPTION);
	if (Status != XST_SUCCESS) {
        xil_printf("\r\nFAIL5\r\n");
		return XST_FAILURE;
	}

	/*
	 * Start the SPI driver so that the device is enabled.
	 */
	XSpi_Start(SpiInstancePtr);

	/*
	 * Disable Global interrupt to use polled mode operation.
	 */
	XSpi_IntrGlobalDisable(SpiInstancePtr);

	/*
	 * Initialize the write buffer with pattern to write, initialize the
	 * read buffer to zero so that it can be verified after the read.
	 */
	Test = 0xF0;
	for (Count = 0; Count < BUFFER_SIZE; Count++) {
		WriteBuffer[Count] = (u8)(Count + Test);
		ReadBuffer[Count] = 0;
	}

	/*
	 * Prepare the data buffers for transmission and to send/receive data
	 * when the SPI device is selected by a master.
	 */
	XSpi_Transfer(SpiInstancePtr, WriteBuffer, ReadBuffer, BUFFER_SIZE);

	/*
	 * Print all the data received from the master so that it can be
	 * compared with the data sent by the master.
	 */
	xil_printf("\r\nReceived data is:\r\n");
	for (Count = 0; Count < BUFFER_SIZE; Count++) {
		xil_printf("0x%x \r\n", ReadBuffer[Count]);
	}

	xil_printf("\r\nExiting the Spi Slave Polled Example.\r\n");

	return XST_SUCCESS;
}
