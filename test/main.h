#include <utils.h>

typedef struct {
  byte red;
  byte gnd;
  byte green;
  byte state; // -1 red, 0 gnd, 1 green;
} LEDTWO;

enum colorz {
  none,
  red,
  green
};

void initLEDTWO(LEDTWO l) {
  pinMode(l.red, OUTPUT);
  pinMode(l.gnd, OUTPUT);
  pinMode(l.green, OUTPUT);
  l.state = 1;
}
void LEDTWOred(LEDTWO l) {
  digitalWrite(l.red, HIGH);
  digitalWrite(l.gnd, LOW);
  digitalWrite(l.green, LOW);
}
void LEDTWOgreen(LEDTWO l) {
  digitalWrite(l.red, LOW);
  digitalWrite(l.gnd, LOW);
  digitalWrite(l.green, HIGH);
}
void LEDTWOboth(LEDTWO l) {
  digitalWrite(l.red, HIGH);
  digitalWrite(l.gnd, LOW);
  digitalWrite(l.green, HIGH);
}
void LEDTWOnone(LEDTWO l) {
  digitalWrite(l.red, LOW);
  digitalWrite(l.gnd, LOW);
  digitalWrite(l.green, LOW);
}
