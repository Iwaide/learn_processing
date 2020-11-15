void setup() {
  size(250, 250);
  frameRate(60);
}

void draw(){
  background(mouseX, 0, mouseY);
  ellipse(mouseX, mouseY, 10, 10);
}

void mousePressed() {
}