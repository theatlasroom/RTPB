import processing.opengl.*;

PVector p;
float bg = 0, fg = 255, op = 10;
ArrayList world;
int num_parts = 50;

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
  frameRate(25);
  //initialize vectors
  float w = width, h = height;
  world = new ArrayList();
  for (int i=1;i<num_parts;i++)
    world.add(new CurvePart(w, h));
}

void Update(){
  //fill(bg, op);
  //rect(0,0,width,height);
  //background(bg, op);  //set bg colour
  stroke(fg);  //set the foreground color with opacity  
  //translate to the centre
  translate(width/2, height/2);  
  CurvePart pt;
  //for (Object obj : world){
    //pt = (CurvePart)obj;
  int i = 0;
  while (world.size() > i){
    pt = (CurvePart)world.get(i);
    pt.Update(frameCount);
    Render(pt.Point());
    i++;
  }
 // }
}

void Render(PVector pt){
  point(pt.x, pt.y);   
}

void keyPressed(){
  if (key == 's')
    saveFrame("sketch-#####.jpg");  
}

