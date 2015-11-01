#include <Esplora.h>
 
void setup() {
  Serial.begin(9600);
}
 
void loop() {
  for(int i = 0; i <= 255; i++) {
    Serial.print("Iteration number: ");
    Serial.println(i);
    Esplora.writeBlue(i);
    delay(5);
  }
  for(int i = 255; i >= 0; i--) {
    Serial.print("Iteration number: ");
    Serial.println(i);
    Esplora.writeBlue(i);
    delay(5);  
  }
}
