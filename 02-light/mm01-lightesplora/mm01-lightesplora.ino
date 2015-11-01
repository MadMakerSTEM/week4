#include <Esplora.h>

// global variables
long start;

void setup() {
  Serial.begin(9600);
}

void loop() {
  int t = millis()-start;
  start = millis();
  int light = Esplora.readLightSensor();
  printValues(light, t);
  delay(10);
}

void printValues(int light, int t) {
  Serial.print(light);
  Serial.print(",");
  Serial.println(t);
}
