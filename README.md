# Motor_controller_DIOT
Multi channel biphase motor controller for optics alignment

## Requirements
- MC shall drive 8 channels of 2-phase stepper motors with a sine/cosine signal to minimize noise
- MC shall have a quadrature decoder input
- MC shall have an SPI as a control interface 
- MC shall have a phase register available through SPI  
- phase register set through SPI shall set each output channel to specific value in a range e.g. 60, 90, 180 degrees etc.
- MC shall have Magneto form factor
- MC shall use CMOD-A7 as a main control unit
- MC shall use RJ48/50 as output connectors 


## Design
Motor controller is an FPGA based control system based on Magneto board. It uses CMOD-A7 as main control unit. 
It is used as a controller for optics adjustment. The control is done through SPI interface which allows for register based 
control of the 8 sin/cos channels that are connected to 2-phase stepper motors. 
MC also has a quadrature input for encoders that can be read out through SPI.  


## PCB design
![PCB](/Doc/Raport%203/Photos/IMG_0665.png)

### Block diagram
![Diagram](/Doc/Raport%202/diagram.jpg)

## Firmware / FPGA design

Motor controller firmware consists of FPGA digital design, microblaze firmware and Arduino code. 
On the high level view, the FPGA receives commands over SPI - using Arduino or backplane to control the motors of the motor controller. 

## FPGA Digital System
The design is a mix of IPs and microblaze soft core for SPI handling. The host controls MC through SPI that is handled by microblaze which set and reads registers controlling sin/cos channels and quadrature inputs. 

### Block diagram
![Diagram](/Doc/Raport%202/fpga.jpg)


# DDS Core configuration 
- Requirements - sin/cos frequency in the range of Hz
Configuration:
- Input clock - 1 MHz
- Phase gen + sin/cos lut 
- Standard mode
- 32 bits phase increment input width
- 10 bit out signal width
- phase output disabled
- aclken signal enabled

DDS core clock is set to 1 MHz and is enabled when sync signal of TLV5675 IP is high to capture sin/cos output of the NCO. The phase increment value is 

FPGA digital system is designed in Vivado 2023.2 using CMOD-A7 module. It consists of Artix 35T FPGA and power supply circuitry. 

Link to reference manual: https://digilent.com/reference/programmable-logic/cmod-a7/reference-manual?redirect=1

The design is split into several modules:
- block design
- sin_cos generation
- quadrature encoder decoding

#### Block design

Block design consists of several IPs connected together, namely:
- microblaze MCU
- clock generation
- AXI register 
- AXI GPIO
- AXI UART
- AXI QUAD SPI (for flash)
- AXI QUAD SPI (for SPI commands)

## Sin/Cos generation
Another module is sin/cos signal generation. This module consists of TLV5637 IP core that controlls 8 DACs in parallel. The CLK and CS are shared between DACs and each DAC has a dedicated data line. And 8 x DDS IP Cores that are configured in a way that it generates sin/cos signal. 

## Microblaze firmware

## Arduino firmware
Arduino firmware allows for sending commands to read and write registers that control the motors

## Commands for testing 

### Initial setup
1. Turn on the power, board should consume around 15 mA without the motor, and around 20-24 mA with motor.
2. Attach the motor to the 1st channel
3. Attach USB-C to Arduino
4. If you want to see debug logs attach the USB-UART interface to PMOD pins 1, 2 as in the picture below
5. SPI MISO needs to be routed externally with a jumper wire directly to Arduino due to a HW bug
6. Program Arduino
7. CMOD by default starts with flashed project
8. Send command "SPI 3" - front LED should start blinking
9. Send command "SPI 2 0 1 FF" - the motor should start spinning faster and faster
10. Send command "SPI 1 0 1" - you should read the value from the previous register


Commands are defined as follow:
[SPI] [COMMAND] [CHANNEL] [REGISTER] [VALUE] 

- COMMAND: CONFIG = 0 - enable/disable a channel, control LED, example SPI 0 0 -> disable all channels, SPI 0 FE - disable last channel 0
- COMMAND: READ = 1 -> read register - example SPI 1 0 1 - register 1 of channel 0 (delta), 
- COMMAND: WRITE = 2 -> write register - example SPI 2 0 0 FFFF0000 -> set threshold register of channel 0, SPI 2 0 1 FFF -> write FFF to delta register
- COMMAN:D TEST = 3 -> blink LED 10 times

### Motor control
Motors are controlled using DDS registers: threshold and delta. Threshold is defined as value where till which the signal will be driven counting down. At start threshold is defined as 0xFFFFFFFF for a channel, and if we set it for example it to 0xFFFF0000 the channel will stop driving the signal to the motor after 0xFFFFF counts. 

Delta register is defined as a phase delta by which the motor frequency increases, by default it's set to 0x20, it takes
some time for the delta register to raise so the initial motor start is slow. Remember that if you set it high the motor will 
speed up quickly. If you want to stop the increase of speed just write 0 to the register. 

### Encoder readout
Encoder can be readout using READ command, example SPI 1 0 2 -> read encoder value of channel 0

## Contact
Piotr Zdunek - p.zdunek90@gmail.com

