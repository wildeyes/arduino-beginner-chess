void setup() {
  pinMode(7, INPUT);
  analogReference(DEFAULT);
  Serial.begin(115200);
}
 void loop() {
   int val;
   val = digitalRead(7);
  Serial.print("VOLTAGE: ");Serial.println(val);
 delayMicroseconds(1);
 // delay(10);
}
