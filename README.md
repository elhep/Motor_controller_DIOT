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
Motion controller is an FPGA based control system based on Magneto board. It uses CMOD-A7 as main control unit. 
It is used as a controller for optics adjustment. The control is done through SPI interface which has a mapped register
that allows the user to set a phase of one of the 8 sin/cos channels that are connected to 2-phase stepper motors. 
MC also has a quadrature input that will serve as TBD.

## Block diagram
```mermaid
---
title: Motion controller 
---
block-beta
columns 9 
  MCU:1 
  space:2
  block:MC:3
  SPI
  block:FPGA:1
  NCOx8
  end
  DAC 
  end
  space:2
  MOTOR:1 
  MCU -->MC
  MC--"x8"-->MOTOR
```

## FPGA Digital System

## PCB design

## Tests

## Contact
Piotr Zdunek - p.zdunek90@gmail.com

>>>>>>> 433c31c... Initial commit. Dummy project and data.
