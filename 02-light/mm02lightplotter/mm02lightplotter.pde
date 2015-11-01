/* Light Sensor plotter
 
 This programs reads the Serial port and plots the value from the light
 meter on the Arduino Esplora. 
 
 Press r to reset the plot, and s to save the data. Data will be stored
 in the 'data' folder. It's a csv for easy viewing in excel.
 
 It also expects the time in milliseconds from the previous data point.
 
 It must come in the format:
 
 light,time
 
 Where light is an integer between 0-1023, and time is the time in milliseconds
 since the previous data point.
 
 Author: Owen Brasier
 Date: September 2015
 http://challenge.madmaker.com.au
 */


import processing.serial.*;

Serial port;
String serial;
Table table;

int temp, light;
int time = 0;
int lf = 10;
boolean canPlot = true;

static int numPoints = 500;        // number of points on the graph
int currentPoint = 0;
float millis;
float totaltime;
int totalRuns = 0;
int box = 20;
float[] data = new float[numPoints];
float[] xAxis = new float[numPoints];

void setup() {
  printArray(Serial.list());
  //String comPort = Serial.list()[0];    // should work on linux
  String comPort = Serial.list()[Serial.list().length-1];    // select the last, windows and mac
  size(800, 600);
  try {
    port = new Serial(this, comPort, 9600);

    port.bufferUntil(lf);
    reset();
  }
  catch (Exception e) {
    println(e);
    println("Exiting! Serial port error! Make sure you choose the correct one in the list above.");
    exit();
  }
}

void draw() {
  drawPlot();
}

void drawPlot() {
  if (canPlot == false) {
    background(255);
    drawBorders();
    for (int i = 1; i < numPoints; i++)
      line(xAxis[i-1], data[i-1], xAxis[i], data[i]);
  }
  if (currentPoint < numPoints && canPlot == true) {
    if (currentPoint == 0)  // reset millis here in case there is a delay in showing the plot
      millis = 0;
    background(255);
    drawBorders();
    float x = map(currentPoint, 0, numPoints, box, width-box);
    float y = map(light, 500, 1023, height-box, box+100);      
    data[currentPoint] = y;
    xAxis[currentPoint] = x;
    text("value: " + light, width-box-120, box+20);
    for (int i = 1; i < currentPoint; i++)
      line(xAxis[i-1], data[i-1], xAxis[i], data[i]);
    currentPoint++;
    totaltime = millis;
  } else {
    canPlot = false;
  }
}

// Draw the borders and axes
void drawBorders() {
  fill(255);                          // fill box with white
  strokeWeight(1);
  rectMode(CORNERS);                  // first two args are top left, second two bottom right
  rect(box, box, width-box, height-box);
  strokeWeight(2);
  fill(0);                            // make text black
  int x1 = box;
  int x2 = width-box;
  // draw the horizontal dots
  for (int i = 0; i <= 50; i++) {
    float x = lerp(x1, x2, i/50.0);
    for (int j = 1; j < 6; j++) {
      float yvalues = map(j, 0, 5, height-box, box+100);
      float y = map(yvalues, 500, 1023, 500, 1000);
      point(x, y);
    }
  }
  // draw the y value text 500 to 1000
  for (int k = 0; k < 6; k++) {
    float yval = lerp(500, 1000, k/5.0);
    float y = map(yval, 500, 1000, height-box-5, box+115-5);
    text(int(yval), box+5, y);
  }
  if (canPlot == false) {
    float x = map(mouseX, box, width-box, 0, totaltime/1000);
    text("time: " +x, width-box-120, box+40);
  }
  float y = map(mouseY, height-box, box+100, 500, 1023);
  text("light: " +y, width-box-120, box+60);
  textSize(16);
  text("Light Meter", box+5, box+20);
  textSize(12);
  text("Press r to restart, and s to save", box+5, box+40);
  strokeWeight(1);
  textSize(12);
}

// Reset the plot
void reset() {
  table = new Table();
  table.addColumn("Time");
  table.addColumn("Light");
  time = 0;
  currentPoint = 0;
  canPlot = true;
}

void saveData() {
  totalRuns++;
  String num = nf(totalRuns, 4);
  String dir = "data/light-"+num+".csv";
  saveTable(table, dir);
  saveFrame("data/light-####.jpg");
}

void storeData() {
  TableRow newRow = table.addRow();
  newRow.setInt("Time", int(millis));
  newRow.setInt("Light", light);
}

int failed = 0;

void serialEvent(Serial port) {
  String serial = "";
  serial = port.readString();
  serial = trim(serial);
  int a[] = int(split(serial, ","));
  if (a.length >= 2) {
    light = a[0];
    millis += a[1];
    storeData();
    failed = 0;
  } else {
    println("wrong type of data found, trying again...");
    failed++;
    if (failed > 20) {
      println("Data is incorrect, exiting.");
      exit();
    }
  }
}

void keyPressed() {
  if (key == 'r') {
    reset();
  }
  if (key == 's') {
    saveData();
  }
}