#include <SPI.h>
#include <Wire.h>

const int CS_PIN = 9;
const int MOSI_PIN = 11;
const int MISO_PIN = 12;
const int SCK_PIN = 13;
const int MUX_OE_PIN = 3;
const int MUX_PIN = 4;

enum {
  CONFIG,
  READ,
  WRITE,
  RESET,
  TEST
} commands_t;

void setup() {
  Serial.begin(9600);
  SPI.begin();
  pinMode(CS_PIN, OUTPUT);
  pinMode(MUX_OE_PIN, OUTPUT);
  pinMode(MUX_PIN, OUTPUT);
  digitalWrite(CS_PIN, HIGH);
  digitalWrite(MUX_OE_PIN, LOW);
  digitalWrite(MUX_PIN, HIGH);
}

void loop() {
  if (Serial.available()) {
    String command = Serial.readStringUntil('\n');
    command.trim();  // Remove extra spaces or newlines
    processCommand(command);
  }
}

void readVoltages();

void processCommand(String command) {
  if (command.startsWith("SPI")) {
    processSPICommand(command);
  } else if (command == "READ_VOLTAGES") {
    readVoltages();
  } else if (command.startsWith("MUX")) {
    controlMUX(command.substring(4).toInt());
  }
}

void printSpiRxData(uint8_t* resp, uint32_t len){
  // Print received SPI data
  for (int i = 0; i < len; i++) {
    Serial.print("Received: 0x");
    Serial.println(resp[i], HEX);
  }
}

void sendSPIdata(byte *resp, byte *data, byte len){
  delay(100);
  digitalWrite(CS_PIN, LOW);
  SPI.beginTransaction(SPISettings(1562500, MSBFIRST, SPI_MODE0));
    // Send SPI data and receive response
  for (int i = 0; i < len; i++) {
    //Serial.print("Sending: 0x");
    //Serial.println(data[i], HEX);
    resp[i] = SPI.transfer(data[i]);
  }
  //printSpiRxData(resp, len);
  SPI.endTransaction();
  digitalWrite(CS_PIN, HIGH);
  delay(100);
}

void processSPICommand(String command) {
  //digitalWrite(CS_PIN, LOW);
  //SPI.beginTransaction(SPISettings(1562500, MSBFIRST, SPI_MODE0));

  // Extract numbers from command
  command.remove(0, 4);  // Remove "SPI " from the start
  command.trim();
  
  long data_uart[16] = {0};
  byte data_spi[16] = {0};
  byte resp[16] = {0};
  int len = 0;

  char *token = strtok((char *)command.c_str(), " ");
  while (token != NULL && len < 16) {
    //data_uart[len] = (uint32_t)atoi(token);
    data_uart[len] = strtoul(token, NULL, 16);
    Serial.print("data_uart: 0x");
    Serial.println(data_uart[len], HEX);
    len++;
    token = strtok(NULL, " ");
  }
  byte cmd = (byte)data_uart[0];
  //Analysing the commands
  switch(cmd){
      case CONFIG: 
      {
        data_spi[0] = cmd;
        data_spi[1] = (data_uart[1] >> 24) & 0xFF;
        data_spi[2] = (data_uart[1] >> 16) & 0xFF;
        data_spi[3] = (data_uart[1] >> 8) & 0xFF;
        data_spi[4] = data_uart[1] & 0xFF;
        sendSPIdata(resp,data_spi,5);
        break;
      }
      case READ:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
      {
        data_spi[0] = cmd;
        sendSPIdata(resp,data_spi,1);
        data_spi[1] = (byte)data_uart[1]; //channel
        data_spi[2] = (byte)data_uart[2]; //register
        sendSPIdata(resp,&data_spi[1],2);
        data_spi[3] = 0;
        data_spi[4] = 0;
        data_spi[5] = 0;
        data_spi[6] = 0;
        
        //sendSPIdata(resp,&data_spi[1],1);
        sendSPIdata(resp,&data_spi[3],5);
        //sendSPIdata(resp,data_spi,7);
        //Serial.print("Read reg: 0x");
        uint32_t reg = (uint32_t)resp[1] << 24 | (uint32_t)resp[2] << 16 | (uint32_t)resp[3] << 8 | (uint32_t)resp[4];
        Serial.println(reg, HEX);
        Serial.println(resp[0], HEX);
        Serial.println(resp[1], HEX);
        Serial.println(resp[2], HEX);
        Serial.println(resp[3], HEX);
        Serial.println(resp[4], HEX);
        break;
      }
      case WRITE:
      {
        data_spi[0] = cmd;
        sendSPIdata(resp,data_spi,1);
        data_spi[1] = (byte)data_uart[1]; //channel
        data_spi[2] = (byte)data_uart[2]; //register
        Serial.print("Write: 0x");
        Serial.println(data_uart[3], HEX);
        data_spi[3] = (data_uart[3] >> 24) & 0xFF;
        data_spi[4] = (data_uart[3] >> 16) & 0xFF;
        data_spi[5] = (data_uart[3] >> 8) & 0xFF;
        data_spi[6] = data_uart[3] & 0xFF;
        sendSPIdata(resp,&data_spi[1],6);
        break;
      }
      case RESET:
      {
        data_spi[0] = cmd;
        sendSPIdata(resp,data_spi,1);
        break;
      }
      case TEST:
      {
        data_spi[0] = cmd;
        sendSPIdata(resp,data_spi,1);
        break;
      }
      default:
        break;
    }

  
  //SPI.endTransaction();
  //digitalWrite(CS_PIN, HIGH);
}


void readVoltages() {
  float vA4 = analogRead(A4) * (6.0 / 1023.0) * ((10.0 + 20.0) / 10.0);
  float vA3 = analogRead(A3) * (5.0 / 1023.0) * ((10.0 + 20.0) / 10.0);
  float vA2 = analogRead(A2) * (3.3 / 1023.0) * ((10.0 + 10.0) / 10.0);
  float vA1 = analogRead(A1) * (3.3 / 1023.0) * ((10.0 + 10.0) / 10.0);
  float vA0 = analogRead(A0) * (12.0 / 1023.0) * ((10.0 + 75.0) / 10.0);

  Serial.print("A4: "); Serial.println(vA4);
  Serial.print("A3: "); Serial.println(vA3);
  Serial.print("A2: "); Serial.println(vA2);
  Serial.print("A1: "); Serial.println(vA1);
  Serial.print("A0: "); Serial.println(vA0);
}

void controlMUX(int state) {
  digitalWrite(MUX_PIN, state);
  Serial.print("MUX set to: "); Serial.println(state);
}
