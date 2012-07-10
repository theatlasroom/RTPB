import processing.video.*;

class VPlayer extends Layer {
  private Movie m;
  
  VPlayer(PApplet parent, String file_name){
   super(parent);
   m = new Movie(parent, file_name);
  }
  
  void setup(){
    m.play();
    m.goToBeginning();
    //m.pause();
  }
  
  void draw(){
    //if (m.ready()){
      image(m, 0, 0, width, height);       
    //}
    /*float t = random(m.duration());     
    if (m.ready()) {
      m.play();
      m.jump(t);
      m.pause();
    }    
    image(m, 0, 0, width, height);*/    
  }
  
  void movieEvent(Movie movie) {
    movie.read();
  }  
}

