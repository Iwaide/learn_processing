void setup() {
  size(250, 250);
  frameRate(120);
}

void draw(){
  fadeToWhite();
  stroke(255, 0, 0);
  fill(255, 0, 0);
  textSize(24);
  text('A', mouseX, mouseY);
  // ellipse(mouseX, mouseY, 10, 10);
}

void mousePressed() {
}

void fadeToWhite() {
  noStroke();
  fill(255, 30);
  rectMode(CORNER);
  rect(0, 0, width, height);
}