class RTBPSystem {
  //particle system for the real time blur particle application
  //uses the RTBParticle class
  //the system monitors a discrete number of frequencies/frequencey bands
  //each particle is associated to one of the discrete levels
  //as the amplitude of the frequencey/band changes the particle is displaced accordingly
  //the path of the particle is traced?...
  //the system updates every 4 frames, allowing the particles to return to their initial position
  int num_particles = 0;
  //special vars for circle implemenetation
  float angle = 0, r = width/100;
  //special vars
  ArrayList system;
  
  RTBPSystem(int num_particles){
    this.num_particles = num_particles;
    system = new ArrayList();
    Initialize();
  }
  
  void Initialize(){
    //initialize the system
    //each iteration calculate a new position for the new particle
    //using parametric equations
    RTBParticle p;
    float increment = TWO_PI/num_particles;
    PVector pos;
    for (int i=0;i<num_particles;i++){
      pos = NewPosition(increment);
      p = new RTBParticle(pos);
      system.add(p);
    }
  }
  
  PVector NewPosition(float increment){
    //this function returns a new vector position based on the shape of the system
    //if the system produces a circle, then each call returns a point along the circumference of the circle
    //println(angle);
    angle += increment;
    return new PVector(r*sin(angle), r*cos(angle));
  }
  
  void update(float[] amplitude){
    //this function takes in a array of frequency amplitudes
    //the amplitude for each freq
    RTBParticle p;
    pushMatrix();
    translate(width/2, height/2);
    for (int i=0;i<num_particles;i++){
      //cast to an object of type RTBParticle
      p = (RTBParticle)system.get(i);
      system.remove(i);
      float v = amplitude[i];
      println("a: " + amplitude[i]);
      PVector force = new PVector(random(-v, v), random(-v, v));
      p.AddForce(force);
      p.UpdateLocation();
      p.Render();
      system.add(p);
      //println(amplitude[i]);
    }  
    popMatrix();   
  }
  
  void test_update(){
    //test updating each particle
    RTBParticle p;
    pushMatrix();
    translate(width/2, height/2);
    for (int i=0;i<num_particles;i++){
      //cast to an object of type RTBParticle
      p = (RTBParticle)system.get(i);
      PVector force = new PVector(random(-1, 1), random(-1, 1));
      p.AddForce(force);
      p.UpdateLocation();
      p.Render();
    }  
    popMatrix();    
  }  
}
