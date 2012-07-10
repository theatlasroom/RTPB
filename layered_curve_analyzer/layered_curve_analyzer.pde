import processing.opengl.*;
import com.nootropic.processing.layers.*;

AppletLayers layers;

void setup(){
  size(720, 720);
  frameRate(20);
  layers = new AppletLayers(this);
  layers.addLayer(new BgDegradeClass(this));
  layers.addLayer(new CurveLayer(this));
}

void draw(){
}

void Grain(){
  //draw digital grain
}

void keyPressed(){
  if (key == 's')
    saveFrame("data/renders/sketch-#####.tif");  
}

void paint() {
  // This method MUST be present in your sketch for layers to be rendered!
  if (layers != null) {
    layers.paint(this);
  } else {
    super.paint();
  }
}

void paint(java.awt.Graphics g) {
  if (layers != null) {
    layers.paint(this);
  } 
  else {
    super.paint(g);
  }
}

