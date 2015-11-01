#include <Esplora.h>
 
void setup() {
  Serial.begin(9600);
}
 
void loop() {
  for(int i = 0; i <= 255; i++) {
    processLed(i);
  }
  for(int i = 255; i >= 0; i--) {
    processLed(i);
  }
}
 
void processLed(int i) {
  // modify this function
}
