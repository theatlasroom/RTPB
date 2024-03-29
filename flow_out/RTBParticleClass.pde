class RTBParticle {
  //simple motion particle class for the RTBlur application
  PVector origin, location, target, vel, accel;
  //needed?
  //PVector accel, vel;
    
  RTBParticle(PVector origin){  
    //initially set all vectors to the original position;
    this.origin = new PVector(origin.x, origin.y);
    this.location = new PVector(origin.x, origin.y);
    //this.target = new PVector(origin.x, origin.y);
    this.vel = new PVector(0, 0); 
    this.accel = new PVector(0, 0);    
  } 
  
  void AddForce(PVector f){
    //apply a force to the particle
    //the force is generated in a higher order function (calling function)
    //reset the acceleration before adding the new force
    accel.mult(0);    
    accel.add(f);
  }
  
  void UpdateLocation(){
    //find the distance from the location to the target
    //if the particle isnt at the target update until it is
    //velocity info can be added later
    //PVector dir = PVector.sub(location, target);   //find the distance between the location and target
    vel.add(accel);
    vel.limit(10);
    location.add(vel);
    Render();
  }
  
  void Render(){    
   // line(location.x,location.y,location.x-vel.x,location.y-vel.y);    
    point(location.x, location.y);
  }
  
  void Origin(){
    //revert the particle to its origin
    this.location = new PVector(origin.x, origin.y);
  }
}
