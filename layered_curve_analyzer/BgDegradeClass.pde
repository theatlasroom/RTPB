class BgDegradeClass extends Layer {
  private int bg = 0, bg_low = 0, bg_high = 20;
  
  BgDegradeClass(PApplet parent){
    super(parent);
  }
  
  void setup(){
    bg = 0;
  }
  
  void draw(){
    bg = (int)random(bg_low, bg_high);
    background(bg);
  }
}
