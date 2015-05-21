#include "main.h"

byte muxWrite(byte addr, bool value) {
  byte bits[maxMuxAddr] = {0, 0, 0, 0, 0, 0};

  for(byte i=0; i<maxMuxAddr; i++){
    bits[i] = addr % 2;
    addr = addr / 2;
  }
  for(int i=0; i<maxMuxAddr; i++){
    digitalWrite(muxPins[i], bits[i]);
  }
  digitalWrite(valuePin, value);
}

void setup() {
  Serial.begin(9600);
}

void loop() {
  muxWrite(0, HIGH);
}