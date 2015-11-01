/* Intro to function
 * 
 * the blinkLed function blinks the blue LED,
 * so in the loop we can call this function
 * by simply writing blinkLed();
 * 
 * Author: Owen Brasier
 * Date: September 2015
 */


#include <Esplora.h>
 
void setup() {
  // This is a function
  Serial.begin(9600);
}
 
void loop() {
  // This is also a function
  blinkLed();
}
 
void blinkLed() {
  // This is also also a function
  Esplora.writeRGB(0, 150, 0);
  delay(1000);
  Esplora.writeRGB(0, 0, 0);
  delay(1000);  
}
