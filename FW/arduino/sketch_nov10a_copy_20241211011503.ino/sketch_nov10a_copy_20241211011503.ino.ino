#include <SPI.h>
#include <Wire.h>

const int CS_PIN = 9;
const int MOSI_PIN = 11;
const int MISO_PIN = 12;
const int SCK_PIN = 13;
const int MUX_OE_PIN = 3;
const int MUX_PIN = 4;

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

void processCommand(String command) {
  if (command.startsWith("SPI")) {
    processSPICommand(command);
  } else if (command == "READ_VOLTAGES") {
    readVoltages();
  } else if (command.startsWith("MUX")) {
    controlMUX(command.substring(4).toInt());
  }
}

void processSPICommand(String command) {
  digitalWrite(CS_PIN, LOW);
  SPI.beginTransaction(SPISettings(1562500, MSBFIRST, SPI_MODE0));

  // Extract numbers from command
  command.remove(0, 4);  // Remove "SPI " from the start
  command.trim();
  
  byte temp[16] = {0};
  byte resp[16] = {0};
  int len = 0;

  char *token = strtok((char *)command.c_str(), " ");
  while (token != NULL && len < 16) {
    temp[len] = (byte)atoi(token);
    len++;
    token = strtok(NULL, " ");
  }

  // Send SPI data and receive response
  for (int i = 0; i < len; i++) {
    Serial.print("Sending: 0x");
    Serial.println(temp[i], HEX);
    resp[i] = SPI.transfer(temp[i]);
  }

  SPI.endTransaction();
  digitalWrite(CS_PIN, HIGH);

  // Print received SPI data
  for (int i = 0; i < len; i++) {
    Serial.print("Received: 0x");
    Serial.println(resp[i], HEX);
  }
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
