import ddf.minim.*;
import ddf.minim.analysis.*;
Minim minim;
AudioPlayer song;
FFT fft;
RTBPSystem field;

float x, y, angle, r;
float[] band_vals;

int bands = 100, variance = 2, bg = 0, stro = 255;

void setup(){
  background(bg);
  stroke(stro, 10);
  strokeWeight(0.25);  
  smooth();  
  size(1400, 850);
  field = new RTBPSystem(bands);
  // always start Minim first!
  minim = new Minim(this);
  //specify 512 for the length of the sample buffers
  //the default buffer size is 1024
  song = minim.loadFile("../../../the_drip.mp3", 512);
  song.play();
  // an FFT needs to know how 
  // long the audio buffers it will be analyzing are
  // and also needs to know 
  // the sample rate of the audio it is analyzing
  fft = new FFT(song.bufferSize(), song.sampleRate());
  fft.linAverages(bands);  
  band_vals = new float[bands];
}

void draw(){  
  //create an alpha layer
  /*fill(bg, 1);
  rect(0, 0, width, height);*/
  //rfilter();
  /***FFT CODE***/
  fft.forward(song.mix);
  /***FFT CODE***/
  
  for (int i=0;i<bands;i++){
    band_vals[i] = fft.getAvg(i);
    //println(fft.getAvg(i));
  }
  field.update(band_vals);
}

void keyPressed(){
  if (key == 's')
    saveFrame("sketch-#####.jpg");  
}

void stop(){
  song.close();
  minim.stop();
  super.stop();
}

