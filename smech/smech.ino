void setup() {
  pinMode(36, OUTPUT);
  analogReference(DEFAULT);
  Serial.begin(115200);
}
 void loop() {
   int val;
  digitalWrite(36, LOW);
   val = analogRead(0);
 Serial.print("Low: ");Serial.print(val);
  delayMicroseconds(1);
  digitalWrite(36,HIGH);
   val = analogRead(0);
  Serial.print(" High: ");Serial.println(val);
 delayMicroseconds(1);
 // delay(10);
}
