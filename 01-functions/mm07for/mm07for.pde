void setup() {
  size(610,610);
}
 
void draw() {
  background(255);
  int x;
  int w = 50, h = 50;     // set width and height
  for(int i = 0; i < 10; i++){
    x = i*w + 10;
    fill(i*20,i*20,100);
    rect(x, 10, w, h);    // (x, y, width, height)
  }
}