class RTBlur{
  float x = 0, y = 0, r, angle;
  float x_size = width/4, y_size = height/4;  
  float pos_x_pad = width/2, pos_y_pad = height/2; 
  float grid_pad = width/10;
  int variance = 2;
  
  void Generate(float low, float midlow, float midhigh, float high){ 
    println("low: " + low + " midlow: " + midlow + " midhigh: " + midhigh + " high: " + high);
    //rfilter(x + pos_x_pad, y + pos_y_pad, x_size, y_size);    
    rfilter();
    pushMatrix();
    translate(pos_x_pad, pos_y_pad);
    angle += noise(high);
    r += random(-low, low);
    r = noise(r) * random(high);
    x = r * cos(radians(angle) + noise(random(-midlow, midlow)));
    y = r * sin(radians(angle) + noise(random(-midhigh, midhigh))); 
    //slightly deform the size
    midlow *= 10;
    midhigh *= 10;
    x_size -= midlow;
    y_size -= midhigh; 
    ell();
    //reset x and y size
    x_size += midlow;
    y_size += midhigh;
    popMatrix();    
  }
  
  void ell(){
    ellipse(x, y, x_size, y_size);    
  }
  
  void squ(){
    //for the rectangle, subtract half the height and width from the start position
    //this ensures it is centered
    rect(x-x_size/2, y-y_size/2, x_size, y_size);    
  }
  
  void rfilter(){
    //run the fitler on the whlle screen
    //println("x: " + x + " y: " + y);
    //println("x_size: " + x_size + " y_size: " + y_size);
    int loc = 0;
    loadPixels(); 
    for (int i=0;i<width;i++){
      for (int j=0;j<height;j++){
         loc = i + j * width;
         //if (i < width/2)
           //pixels[loc] = right_edge_filter(i, j, loc);
         //else
         pixels[loc] = right_edge_filter(i, j, loc);
      }    
    }
    updatePixels();
  }  
  
  void rfilter(float x, float y, float x_size, float y_size){
    //run the filter on a section of the screen surrounding the active object
    //println("x: " + x + " y: " + y);
    //println("x_size: " + x_size + " y_size: " + y_size);
    int loc = 0;
    loadPixels();
    //localize the operation to a grid around where the target object appears
    //assume the object is draw from teh center
    //x_size and y_size are the length and width of the object
    //the area in the x direction is from (x - x_size/2 to x + x_size/2)
    //the area in the x direction is from (y - y_size/2 to y + y_size/2)  
    int x_start = (int)(x - x_size/2 - grid_pad), x_end = (int)(x + x_size/2 + grid_pad);    
    int y_start = (int)(y - y_size/2 - grid_pad), y_end = (int)(y + y_size/2 + grid_pad);     
    for (int i=x_start;i<x_end;i++){
      for (int j=y_start;j<y_end;j++){
         loc = i + j * width;
         //if (i < width/2)
           //pixels[loc] = right_edge_filter(i, j, loc);
         //else
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
     //invert the color
     //diff = abs(255 - diff);
     return color(diff);   
  }
}
