import processing.opengl.*;

PVector p;
float bg = 0, fg = 255, bg_op = 1, str_op = 10;
ArrayList world;
int num_parts = 100;
AudioAnalyzer audio;
float[] audiobuffer; 

void setup(){
  size(720, 720, OPENGL);
  //initialize    
  Init();
}

void draw(){ 
  RefreshCanvas();
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
  //create audio analyzer
  audio = new AudioAnalyzer(this, "../audio/Reprise.wav", num_parts);  
  //set stroke off
  noStroke();
  //set the foreground color with opacity
  fill(fg, str_op);  
  audio.Start();
  audiobuffer = new float[num_parts];
}

void Update(){
  audiobuffer = audio.Analyze();
  //translate to the centre
  translate(width/2, height/2);  
  CurvePart pt;
  for (int i = 0; i < world.size(); i++){
    pt = (CurvePart)world.get(i);    
    if (audiobuffer[i] > 0.5){
      pt.Update(frameCount);
    }    
    Render(pt.Point());
    //println(Arrays.toString(audiobuffer));
  }
}

void RefreshCanvas(){
   
}

void Render(PVector pt){
  Grain();
  ellipse(pt.x, pt.y, 2, 2);   
}

void Grain(){
  //draw digital grain
}

void keyPressed(){
  if (key == 's')
    saveFrame("data/renders/sketch-#####.tif");  
}

