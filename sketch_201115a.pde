import ddf.minim.*;

Minim minim;
AudioPlayer player;

void setup() {
  minim = new Minim(this);
  player = minim.loadFile("jyokaku.mp3", 2048);
  player.play(); //再生
}

void draw() {
}

void stop() {
  player.close();
  minim.stop();

  super.stop();
}
