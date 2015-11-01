/*
 * Automated Speed Detector
 * 
 * This program detects the speed an object as it
 * passes over the Esplora light sensor. You need
 * to set the threshold value, and the distance
 * the object moves (the size of the object), in
 * meters.
 * 
 * Author: Owen Brasier
 * Date: September 2015
 * http://challenge.madmaker.com.au
 */


#include <Esplora.h>

// this is the size of the object
// if you don't have a ruler you can
// use iruler.net to measure the size
float distance = 0.2;

// the threshold you used for the last section
int threshold = 950;

// Global variable declarations
float maximum, minimum, range, avg, speed;
float sum = 0.0;
int light;
int count = 1;

void setup() {

}

void loop() {
  Esplora.writeRGB(0, 50, 0);
  light = Esplora.readLightSensor();
  if (light < threshold) {
    runMeasurement();
  }
}

void runMeasurement() {
  long start = millis();        // get the start time
  Esplora.writeRGB(0, 0, 150);
  while (light < threshold) {
    light = Esplora.readLightSensor();
  }
  long finish = millis();       // get the finish time
  speed = getSpeed(start, finish);
  avg = getAverage();
  range = getRange();
  printValues();
  count++;
}

float getSpeed(long s, long f) {
  float time = (f-s)/1000.0;     // time in seconds
  // remember the equation for speed.
  speed = 0.0;                   // MODIFY THIS LINE!
  return speed;
}

float getAverage() {
  sum += speed;
  // return the average using the formula
  // for average
  return 0.0;   
}

float getRange() {
  if(count == 1) {
    maximum = speed;
    minimum = speed;
  }
  // see if speed greater than current maximum
  // set maximum
  // see if speed less than current minimum
  // set minimum
  // return the range
  return 0.0;    
}

void printValues() {
  Serial.print("Run: ");
  Serial.print(count);
  Serial.print("\tSpeed: ");
  Serial.print(speed);
  Serial.print(" m/s");
  Serial.print(" \tCurrent Avg: ");
  Serial.print(avg);
  Serial.print(" m/s"); 
  Serial.print("\tRange: ");
  Serial.println(range);
}
