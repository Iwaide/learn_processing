import ddf.minim.*;

Minim minim;
AudioPlayer player;

void setup()
{
colorMode( HSB, 255 );
size( 640, 480, P2D);
frameRate(120);
minim=new Minim(this);
player=minim.loadFile("jyokaku.mp3");
player.setGain(-20);
player.loop();
background(255,0,200);
}

void draw()
{
  float circleColor = player.mix.level() * 1000 % 255;
  println("var: "+circleColor); 
  fadeToWhite();
  stroke(109, 171, circleColor);
  fill(109, 171, circleColor);
  float radiusL=player.left.level() * width;
  float radiusR=player.right.level() * width;
  ellipse(width/3, height/2,radiusL,radiusL);
  ellipse(width/3*2,height/2,radiusR,radiusR);
}

void fadeToWhite() {
  noStroke();
  fill(255,0,200, 30);
  rectMode(CORNER);
  rect(0, 0, width, height);
}
