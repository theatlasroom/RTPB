class GrainClass extends Layer {
  private int max_parts = 5;
  
  GrainClass(PApplet parent){
    super(parent);
  }
  
  void setup(){
    
  }
  
  void draw(){
    float e_size_w = 0, e_size_h=0; 
    background(0, 0);
    noFill();
    stroke(255, 30);
    int grain_particles = (int)random(max_parts);
    for (int i=grain_particles;i>0;i--){
      ellipse(random(width), random(height),random(8),random(8));
      point(random(width), random(height));
      point(random(width), random(height));      
    }
  }
}
