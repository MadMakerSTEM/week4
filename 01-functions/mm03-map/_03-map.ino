/* The map function
 *  
 * Example of the map function using the slider
 * to control the LED.
 * 
 * Author: Owen Brasier
 * Date: September 2015
 * http://challenge.madmaker.com.au
 */


#include <Esplora.h>
 
void setup() {
  // This is a function
  Serial.begin(9600);
 
}
 
void loop() {
  // This is also a function
  int slider = Esplora.readSlider();
  int blue = map(slider, inputLow, inputHigh, outputLow, outputHigh);
  controlLed(blue);  // send to blinkLed
  printValues(slider, blue);
}
 
void controlLed(int b) {
  Esplora.writeRGB(0, 0, b);
}

void printValues(int s, int b) {
  Serial.print("Slider is : ");
  Serial.print(s);
  Serial.print("\tMapped output is: ");
  Serial.println(b);
}
