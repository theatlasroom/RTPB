  
class CurveLayer extends Layer {  
  PVector p;
  float bg = 255, fg = 0, bg_op = 1, str_op = 1;
  ArrayList world;
  int num_parts = 100;
  AudioAnalyzer audio;
  float[] audiobuffer;
  PApplet parent;
 
  CurveLayer(PApplet parent){
    super(parent);  //must be first
    this.parent = parent;
  } 
  
  void setup(){
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
    float px, py = 0;
    world = new ArrayList();
    for (int i=1;i<num_parts;i++){
      px = (i * (width/num_parts) - width/2);
      world.add(new CurvePart(new PVector(px, py), width, height));
    }
    //create audio analyzer
    audio = new AudioAnalyzer(this.parent, "../audio/Physika.wav", num_parts);  
    //set stroke off
    noStroke();
    //set the foreground color with opacity
    //fill(fg, str_op);  
    audio.Start();
    audiobuffer = new float[num_parts];
  }
  
  void Update(){
    audiobuffer = audio.Analyze();
    //translate to the centre
    translate(width/2, height/2);  
    CurvePart pt;
    colorMode(HSB, num_parts);
    for (int i = 0; i < world.size(); i++){    
      if (audiobuffer[i] > 0.5){
        //stroke(360, i, 100, str_op);
        stroke(255, str_op);
        //fill(0, 0);
        pt = (CurvePart)world.get(i);      
        pt.Update(frameCount);
        Render(pt.Point());      
      }    
    }
  }
  
  void Render(PVector pt){ellipse(pt.x, pt.y, 1, 1);}
}
