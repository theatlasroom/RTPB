class RTBlur{
  float x, y, r, angle;
  int variance = 2;
  
  void Generate(float input){
    rfilter();    
    pushMatrix();
    translate(width/2, height/2);
    angle += noise(input);
    r += random(-input, input);
    r = noise(r) * random(input);
    x = r * cos(radians(angle) + noise(random(-input, input)));
    y = r * sin(radians(angle) + noise(random(-input, input)));  
    stroke(255);
    ellipse(x, y, width/4, height/4);
    popMatrix();    
  }
  
  void rfilter(){
    int loc = 0;
    loadPixels();
    for (int i=0;i<width;i++){
      for (int j=0;j<height;j++){
         loc = i + j * width;
         if (i < width/2)
           pixels[loc] = right_edge_filter(i, j, loc);
         else
           pixels[loc] = right_edge_filter(i, j, loc);
      }    
    }
    updatePixels();
  }
  
  color left_edge_filter(int x, int y, int loc){
     int left_loc = 0;   
     if (x > 0) 
       left_loc = (x-1) + y * width;    
     else 
       left_loc = loc;
     float diff = abs(brightness(pixels[loc]) - brightness(pixels[left_loc]));
     return color(diff);   
  } 
  
  color right_edge_filter(int x, int y, int loc){
     int right_loc = 0;   
     if (x < width-1) 
       right_loc = (x+1) + y * width;    
     else 
       right_loc = loc;
     float diff = abs(brightness(pixels[loc]) - brightness(pixels[right_loc]));
     return color(diff);   
  }
}
