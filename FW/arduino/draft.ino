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
  digitalWrite(MUX_OE_PIN, HIGH);
  digitalWrite(MUX_PIN, HIGH);
}

void loop() {
  if (Serial.available()) {
    String command = Serial.readStringUntil('\n');
    processCommand(command);
  }
}

void processCommand(String command) {
  if (command.startsWith("SPI")) {
    digitalWrite(CS_PIN, LOW);
    SPI.beginTransaction(SPISettings(1000000, MSBFIRST, SPI_MODE0));
    byte response = SPI.transfer(command.substring(4).toInt());
    SPI.endTransaction();
    digitalWrite(CS_PIN, HIGH);
    Serial.println(response, HEX);
  } else if (command == "READ_VOLTAGES") {
    readVoltages();
  } else if (command.startsWith("MUX")) {
    controlMUX(command.substring(4).toInt());
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
