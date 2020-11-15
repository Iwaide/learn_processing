float x;
float y;
void setup() {
  size(250, 250);
  frameRate(120);
  x = 0;
  y = height / 2;
}

void draw(){
  background(204);
  x = x+1;
  if (x > width) {
    x = -10;
    y = random(width - 10);
  };
  rect(x, y, 10, 10);
}

void mousePressed() {
}

void fadeToWhite() {
  noStroke();
  fill(255, 30);
  rectMode(CORNER);
  rect(0, 0, width, height);
}