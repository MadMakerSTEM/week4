void setup() {
  size(610, 610);
}

void draw() {
  background(255);
  int x,y;
  int w = 50, h = 50;                 // set width and height
  for (int i = 0; i < 10; i++) {      // initial for loop going across
    for (int j = 0; j < 10; j++) {    // second loop going down
      x = i*w + 10;                   // CHANGE THIS LINE - SOLUTION TO YOUR EQUATION
      y = j*h + 10;                   // ALSO CHANGE THIS LINE
      fill(i*20, j*20, 100);
      rect(x, y, w, h);               // (x, y, width, height)
    }
  }
}