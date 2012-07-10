class ShapeFormClass extends Layer {
  
  ShapeFormClass(PApplet parent){
    super(parent);
  }
  
  void setup(){
  }
  
  void draw(){
    background(0,0);
    stroke(255, 100);
    noFill();    
    int r_w = 100, r_h = 50;
    rect(width/2-r_w/2+random(5), height/2-r_h/2+random(5), r_w, r_h);
  }
}
