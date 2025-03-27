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
#define SPI_DEVICE_ID		XPAR_SPI_0_DEVICE_ID

/*
 * This is the size of the buffer to be transmitted/received in this example.
 */
#define BUFFER_SIZE		4

/**************************** Type Definitions *******************************/


/***************** Macros (Inline Functions) Definitions *********************/


/************************** Function Prototypes ******************************/

static int SpiSlavePolledExample(XSpi *SpiInstancePtr, UINTPTR BaseAddress);
static int SpiInit(XSpi *SpiInstancePtr, UINTPTR BaseAddress);

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
    MC_CTRL_S00_AXI_SLV_REG2_OFFSET,
    MC_CTRL_S00_AXI_SLV_REG3_OFFSET,
    MC_CTRL_S00_AXI_SLV_REG4_OFFSET,
    MC_CTRL_S00_AXI_SLV_REG5_OFFSET,
    MC_CTRL_S00_AXI_SLV_REG6_OFFSET,
    MC_CTRL_S00_AXI_SLV_REG7_OFFSET,
    MC_CTRL_S00_AXI_SLV_REG8_OFFSET,
    MC_CTRL_S00_AXI_SLV_REG9_OFFSET,
    MC_CTRL_S00_AXI_SLV_REG10_OFFSET,
    MC_CTRL_S00_AXI_SLV_REG11_OFFSET,
    MC_CTRL_S00_AXI_SLV_REG12_OFFSET,
    MC_CTRL_S00_AXI_SLV_REG13_OFFSET,
    MC_CTRL_S00_AXI_SLV_REG14_OFFSET,
    MC_CTRL_S00_AXI_SLV_REG15_OFFSET,
    MC_CTRL_S00_AXI_SLV_REG16_OFFSET,
    MC_CTRL_S00_AXI_SLV_REG17_OFFSET,
    MC_CTRL_S00_AXI_SLV_REG18_OFFSET,
    MC_CTRL_S00_AXI_SLV_REG19_OFFSET,
    MC_CTRL_S00_AXI_SLV_REG20_OFFSET,
    MC_CTRL_S00_AXI_SLV_REG21_OFFSET,
    MC_CTRL_S00_AXI_SLV_REG22_OFFSET,
    MC_CTRL_S00_AXI_SLV_REG23_OFFSET,
    MC_CTRL_S00_AXI_SLV_REG24_OFFSET
};



int main(void)
{
    xil_printf("MC FW VER %d.%d\r\n", FW_VER_MAJOR, FW_VER_MINOR);

	int Status;

    MC_CTRL_Reg_SelfTest(MC_CTRL_BaseAddress);
    SpiInit(&SpiInstance, XPAR_XSPI_0_BASEADDR);

    int res = XST_SUCCESS; 
    while(res == XST_SUCCESS){
        for(int i = 0; i < BUFFER_SIZE; i++){
            WriteBuffer[i] = 0;
            ReadBuffer[i] = 0;
        }
        res = XSpi_Transfer(&SpiInstance, WriteBuffer, ReadBuffer, 1);
        #ifdef VERBOSE_DEBUG
            xil_printf("\r\nReceived data is:\r\n");
            xil_printf("0x%x \r\n", ReadBuffer[Count]);
            for(int Count = 0; Count < BUFFER_SIZE; Count++) {
                xil_printf("0x%x \r\n", ReadBuffer[Count]);
            }
        #endif

        int cmd = ReadBuffer[0];
        xil_printf("CMD: %d\r\n", cmd);
        switch(cmd){
            case CONFIG: 
            {
                res = XSpi_Transfer(&SpiInstance, WriteBuffer, ReadBuffer, 4);
                #ifdef VERBOSE_DEBUG
                    xil_printf("\r\nRX: 0x%x \r\n",ReadBuffer[0] << 24 | ReadBuffer[1] << 16 | ReadBuffer[2] << 8 | ReadBuffer[3] & 0xFF);
                #endif
                MC_CTRL_mWriteReg(MC_CTRL_BaseAddress,MC_CTRL_S00_AXI_SLV_REG0_OFFSET,ReadBuffer[0] << 24 | ReadBuffer[1] << 16 | ReadBuffer[2] << 8 | ReadBuffer[3] & 0xFF);
                break;
            }
            case READ: 
            {
                res = XSpi_Transfer(&SpiInstance, WriteBuffer, ReadBuffer, 2);
                int channel = ReadBuffer[0];
                int reg = ReadBuffer[1];              
                if(reg == 2){ channel = channel + 8; reg = 0;} // add offset for encoder register  
                
                uint32_t val = MC_CTRL_mReadReg(MC_CTRL_BaseAddress,(channel+1)*8 - 4 + reg*4);
                xil_printf("\r\n%x %x \r\n",(channel+1)*8 - 4 + reg*4, val);
                WriteBuffer[3] = val & 0xFF;
                WriteBuffer[2] = (val >> 8) & 0xFF;
                WriteBuffer[1] = (val >> 16) & 0xFF;
                WriteBuffer[0] = (val >> 24) & 0xFF;
                
                xil_printf("\r\n%x %x %x %x\r\n",WriteBuffer[0], WriteBuffer[1],WriteBuffer[2],WriteBuffer[3]);
                // TODO: For some reason first byte is duplicated when sending, so need to send 5 bytes.
                res = XSpi_Transfer(&SpiInstance, WriteBuffer, ReadBuffer, 5);
                
                break;

            }
            case WRITE:
            {
                res = XSpi_Transfer(&SpiInstance, WriteBuffer, ReadBuffer, 6);
                int channel = ReadBuffer[0]; //0-7
                int reg = ReadBuffer[1]; // 0 - threshold, 1 - phase inc delta
                int val = ReadBuffer[2] << 24 | ReadBuffer[3] << 16 | ReadBuffer[4] << 8 | (ReadBuffer[5] & 0xFF);

                #ifdef VERBOSE_DEBUG
                    xil_printf("\r\nWRITE:0x%x CH:0x%x R:0x%x Val:0x%x Tst:0x%d\r\n", cmd, channel, reg, val, (channel+1)*8 - 4 + reg*4);
                #endif

                MC_CTRL_mWriteReg(MC_CTRL_BaseAddress,(channel+1)*8 - 4 + reg*4,val); 
                break;
            }
            case RESET: 
            {
                MC_CTRL_mWriteReg(MC_CTRL_BaseAddress,MC_CTRL_S00_AXI_SLV_REG0_OFFSET,0xFF);
                MC_CTRL_mWriteReg(MC_CTRL_BaseAddress,MC_CTRL_S00_AXI_SLV_REG0_OFFSET,0);
                break;
            }
            case TEST:
            {
                for(int i = 0; i < 10; i++){
                    MC_CTRL_mWriteReg(MC_CTRL_BaseAddress,MC_CTRL_S00_AXI_SLV_REG0_OFFSET,1 << 9);
                    sleep(1);
                    MC_CTRL_mWriteReg(MC_CTRL_BaseAddress,MC_CTRL_S00_AXI_SLV_REG0_OFFSET,0);
                    sleep(1);
                }
                break;
            }
            default:
                break;
        }
    }
    
	return XST_SUCCESS;
}

static int CommandReceive(XSpi *SpiInstancePtr,u8* CommandBuffer){


}

static int SpiInit(XSpi *SpiInstancePtr, UINTPTR BaseAddress)
{
	XSpi_Config *ConfigPtr;
	int Status;
	u32 Count;

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
    xil_printf("\r\nSPI Init SUCCESS\r\n");
	return XST_SUCCESS;
}
