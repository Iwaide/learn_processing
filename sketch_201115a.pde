import ddf.minim.*;

Minim minim;
AudioSample kick;
AudioSample snare;

void setup() {
  minim = new Minim(this);
  kick = minim.loadSample("kick.wav", 2048);
  snare = minim.loadSample("snare.wav", 2048);
}

void draw() {
}

void keyPressed() {
  if (key == 'k') kick.trigger();
  if (key == 's') snare.trigger();
}

void stop() {
  kick.close();
  snare.close();
  minim.stop();

  super.stop();
}