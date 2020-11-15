import ddf.minim.*;
import ddf.minim.analysis.*;
Minim minim;
AudioPlayer player;
FFT fft;
int fftSize;
PImage img;

void setup()
{
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
  background(255);
  // tint(255.0, 168 );
  image(img, 0, 0, width, height);
	fft.forward(player.mix);
	for (int i = 0; i < fft.specSize(); i += 5)
	{
		float x = map(i,0,fft.specSize(),0,width);
    float y = map(fft.getBand(i),0, 5.0, height, 0);
		fill(182, 100, 80, 30);
    stroke(182, 100, 80, 40);
    rect(x,y,15,height - y);
	}
}

