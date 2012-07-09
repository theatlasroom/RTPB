import ddf.minim.*;
import ddf.minim.analysis.*;
Minim minim;
AudioPlayer song;
FFT fft;

RTBlur bobj;

void setup(){
  background(0);
  size(500, 500);
  bobj = new RTBlur();
  smooth();
  
  // always start Minim first!
  minim = new Minim(this);
 
  // specify 512 for the length of the sample buffers
  // the default buffer size is 1024
  song = minim.loadFile("../../../the_drip.mp3", 512);
  song.play();
 
  // an FFT needs to know how 
  // long the audio buffers it will be analyzing are
  // and also needs to know 
  // the sample rate of the audio it is analyzing
  fft = new FFT(song.bufferSize(), song.sampleRate());  
}

float x, y, angle, r;
int variance = 2;

void draw(){   
  /***FFT CODE***/
  fft.forward(song.mix);
  //stroke(255);
  //line(width/2, 150 + song.right.get(0)*50, 400+1, 150 + song.right.get(0)*50);
  /***FFT CODE***/
  //println();
   //put an alpha layer
   float bg = (song.mix.get(10) * 100) % 255;
  fill(0, bg);
  rect(0, 0, width, height); 
  //generate shape
  bobj.Generate(song.mix.get(0)*100);
}

void stop(){
  song.close();
  minim.stop();
  super.stop();
}

