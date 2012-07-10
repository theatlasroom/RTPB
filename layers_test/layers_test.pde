/*sketch to the test the layers library*/

import processing.opengl.*;
import com.nootropic.processing.layers.*;

AppletLayers layers;

void setup(){
  size(580, 580);
  frameRate(20);
  layers = new AppletLayers(this);
  //layers.addLayer(new BgDegradeClass(this));
  layers.addLayer(new VPlayer(this, "dutch.mp4"));
  //layers.addLayer(new GrainClass(this));
  //layers.addLayer(new ShapeFormClass(this));  
}

void paint(java.awt.Graphics g) {
  if (layers != null) {
    layers.paint(this);
  } 
  else {
    super.paint(g);
  }
}

void draw(){
}
