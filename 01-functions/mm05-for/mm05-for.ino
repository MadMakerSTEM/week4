void setup() {
  Serial.begin(9600);
}
 
void loop() {
  for(int i = 0; i < 5; i++) {
    Serial.println(i);
  }
  Serial.println("Done!");
  delay(5000);
}
