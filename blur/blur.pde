

import ddf.minim.*;
import ddf.minim.analysis.*;
Minim minim;
AudioPlayer song;
FFT fft;
RTBlur bobj;

int bg = 0, stro = 255;

void setup(){
  background(bg);
  stroke(stro);
  strokeWeight(0.25);  
  size(500, 500);
  bobj = new RTBlur();
  smooth();
  
  // always start Minim first!
  minim = new Minim(this);
 
  // specify 512 for the length of the sample buffers
  // the default buffer size is 1024
  song = minim.loadFile("../audio/Reprise.wav", 512);
  song.play();
 
  // an FFT needs to know how 
  // long the audio buffers it will be analyzing are
  // and also needs to know 
  // the sample rate of the audio it is analyzing
  fft = new FFT(song.bufferSize(), song.sampleRate());
  fft.linAverages(4);  
}

float x, y, angle, r;
int variance = 2;

void draw(){  
  //put an alpha layer
  fill(bg, 15);
  rect(0, 0, width, height); 
  /***FFT CODE***/
  fft.forward(song.mix);
  //stroke(255);
  //line(width/2, 150 + song.right.get(0)*50, 400+1, 150 + song.right.get(0)*50);
  /***FFT CODE***/
  //println();
  float low = fft.getAvg(0)*5;
  float midlow = fft.getAvg(1)*5;
  float midhigh = fft.getAvg(2)*5; 
  float high = fft.getAvg(3)*5;
  bobj.Generate(low, midlow, midhigh, high);
}

void stop(){
  song.close();
  minim.stop();
  super.stop();
}

