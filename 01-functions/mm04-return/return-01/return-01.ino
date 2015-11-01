#include <Esplora.h>
 
void setup() {
  Serial.begin(9600);
}
 
void loop() {
  int joystick = Esplora.readJoystickX();
  int x = tripleNumber(joystick);
  Serial.print("Joystick: ");
  Serial.print(joystick);
  Serial.print("\tTriple: ");
  Serial.println(x);
}
 
int tripleNumber(int n) {
  return n*3;
}
