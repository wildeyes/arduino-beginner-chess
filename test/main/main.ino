#include "main.h"

LEDTWO leds[] = {{30 ,32 ,34} ,{36 ,38 ,40} ,{42 ,44 ,46} ,{48, 50, 52}};

void setup() {
  initLEDTWO(leds[0]);
  initLEDTWO(leds[1]);
  initLEDTWO(leds[2]);
  initLEDTWO(leds[3]);
  Serial.begin(9600);
}
void loop()
{


  bool colorChangeStep = true;
  byte index = 1;
  if(colorChangeStep)
    for(int i=1; i<sizeof(leds); i++){
      leds[i].state = 1;
    }
  else {
    index++;
  }

  colorChangeStep ^= true;
  if(index >= 3)
    index = 1;

  for(int i=index; i<sizeof(leds); i++){
    LEDTWO l = leds[i];
    if(l.state)
      LEDTWOgreen(l);
    else
      LEDTWOred(l);
  }
  Serial.println("s");

  LEDTWOboth(leds[0]);
  delay(50);
}