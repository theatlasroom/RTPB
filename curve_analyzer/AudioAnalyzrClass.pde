import processing.core.*;
import ddf.minim.*;
import ddf.minim.analysis.*;

class AudioAnalyzer {  
  private Minim minim;
  private AudioPlayer song;
  private FFT fft;
  private String song_file = "";
  private int freq;
 
  AudioAnalyzer(String song_file, PApplet parent, int freq){
    this.song_file = song_file;
    this.freq = freq;
    // always start Minim first!
    minim = new Minim(parent);
    // specify 512 for the length of the sample buffers
    // the default buffer size is 1024
    song = minim.loadFile("../audio/Reprise.wav", 512);      
  } 
  
  void Start(){song.play();}
  void Stop(){song.stop();}  
 
  void Cleanup(){
    //clean up objects created;
    this.fft = null;
    this.song.close();
    this.minim.stop();    
  } 
}
