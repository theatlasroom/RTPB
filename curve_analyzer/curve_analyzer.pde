import processing.opengl.*;

PVector p;
float bg = 0, fg = 255, bg_op = 1, str_op = 10;
ArrayList world;
int num_parts = 100;

void setup(){
  size(500, 500, OPENGL);
  //initialize    
  Init();
}

void draw(){  
  Update();
}

void Init(){
  background(bg);
  smooth();
  frameRate(20);
  //initialize vectors
  float w = width, h = height;
  world = new ArrayList();
  for (int i=1;i<num_parts;i++)
    world.add(new CurvePart(w, h));
}

void Update(){
  RefreshCanvas();
  //translate to the centre
  translate(width/2, height/2);  
  CurvePart pt;
  for (Object obj : world){
    pt = (CurvePart)obj;
    pt.Update(frameCount);
    Render(pt.Point());
  }
}

void RefreshCanvas(){
  //bg = random(0, 12);
  //fill(bg, 10);  //set bg colour 
  //rect(0,0,width,height);
  noStroke();
  fill(fg, str_op);  //set the foreground color with opacity  
}

void Render(PVector pt){
  ellipse(pt.x, pt.y, 2, 2);   
}

void keyPressed(){
  if (key == 's')
    saveFrame("data/renders/sketch-#####.tif");  
}

