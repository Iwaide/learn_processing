import ddf.minim.*;
import ddf.minim.analysis.*;
Minim minim;
AudioPlayer player;
FFT fft;
int fftSize;
PImage img;
boolean playing = true;

void setup()
{
  smooth();
  size(960, 540, P2D);
	colorMode(HSB,360,100,100,100);
	minim = new Minim(this);
	fftSize = 512;
	player = minim.loadFile("hazel.mp3",fftSize);
  player.setGain(-20);
	player.loop();
	fft = new FFT(player.bufferSize(),player.sampleRate());
  img = loadImage("image.jpg");
  frameRate(20);
}

void draw()
{
  if (playing) {
    image(img, 0, 0, width, height);
  }
	fft.forward(player.mix);
	for (int i = 0; i < fft.specSize() - 20; i++)
	{
		float x = map(i,0,fft.specSize(),0,width);
    float y = 0;
    if (i < 100 || i >= fft.specSize() - 20) {
      y = map(fft.getBand(i),0, 5.0, height, 0);
    } else {
      y = map(fft.getBand(i) * i,0, fftSize, height, 0);
    }
    if (y < 0) {
      y = 0;
    }
		fill(0,0, 20, 30);
    stroke(0,0, 20, 40);
    rect(x,y, 1, height);
	}
}


void mousePressed() {
  if (playing) {
    player.pause();
    playing = false;
  } else {
    player.play();
    playing = true;
  }
}