Test[] instances =  new Test[3]; 
 
void setup() {
  size(200, 600);
  noStroke(); 
  // init them: (xPos, yPos, width, height)
  instances[0] = new Test(20, 20, 40, 20);
  instances[1] = new Test(80, 20, 40, 20);
  instances[2] = new Test(140, 20, 40, 20);
}
 
void draw() {
  background(100);
 
  //call run method...
  for (Test t:instances)
    t.run();
}
 
 
void mousePressed() {
 
  //lock if clicked
  for (Test t:instances)
  {
    if (t.isOver())
      t.lock = true;
  }
}
 
void mouseReleased() {
 
  //unlock
  for (Test t:instances)
  {
    t.lock = false;
  }
}
 
 
class Test {
  //class vars
  float x;
  float y;
  float w, h;
  float initialY;
  boolean lock = false;
 
  //constructors
 
  //default
  Test () {
  }
 
  Test (float _x, float _y, float _w, float _h) {
 
    x=_x;
    y=_y;
    initialY = y;
    w=_w;
    h=_h;
  }
 
 
  void run() {
 
    // bad practice have all stuff done in one method...
    float lowerY = height - h - initialY;
 
    // map value to change color..
    float value = map(y, initialY, lowerY, 120, 255);
 
    // map value to display
    float value2 = map(value, 120, 255, 100, 0);
 
    //set color as it changes
    color c = color(value);
    fill(c);
 
    // draw base line
    rect(x, initialY, 4, lowerY);
 
    // draw knob
    fill(200);
    rect(x, y, w, h);
 
    // display text
    fill(0);
    text(int(value2) +"%", x+5, y+15);
 
    //get mouseInput and map it
    float my = constrain(mouseY, initialY, height - h - initialY );
    if (lock) y = my;
  }
 
  // is mouse ove knob?
  boolean isOver()
  {
    return (x+w >= mouseX) && (mouseX >= x) && (y+h >= mouseY) && (mouseY >= y);
  }
}
