#include "main.h"

LEDTWO leds[] = {{30 ,32 ,34} ,{36 ,38 ,40} ,{42 ,44 ,46} ,{48, 50, 52}};

void setup() {
  initLEDTWO(leds[0]);
  initLEDTWO(leds[1]);
  initLEDTWO(leds[2]);
  initLEDTWO(leds[3]);
  Serial.begin(9600);
}
// Up until 63
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


byte len = 4;
byte index = 1;
bool oneLedRound = true;
bool colorChangeStep = true;

void loop()
{
  for(int i=1; i<len; i++){
    LEDTWOnone(leds[i]);
  }
  if(colorChangeStep) {
    for(int i=1; i< len; i++){
      leds[i].state ^= 1;
    }

    muxWrite(2, HIGH);
  } else {
    index++;
    muxWrite(6, HIGH);
  }

  colorChangeStep ^= 1;

  if(index > 4) {
    index = 1;
    oneLedRound ^= 1;
  }

  for(int i=index; i < len; i++){
    LEDTWO l = leds[i];
    if(l.state)
      LEDTWOgreen(l);
    else
      LEDTWOred(l);
  }

  if(oneLedRound)
    LEDTWOboth(leds[0]);
  else
    LEDTWOnone(leds[0]);

  delay(2000);
}