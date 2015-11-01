void setup() {
  size(610,610);
}
 
void draw() {
  background(255);
  int y;
  int w = 50, h = 50;       // set width and height
  for(int i = 0; i < 10; i++){
    y = i*w + 10;           // Modify this line based on the equation
    fill(i*20,i*20,100);
    rect(10, y, w, h);      // (x, y, width, height)
  }
}