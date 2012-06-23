import processing.opengl.*;
import toxi.processing.*;
import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.math.*;

float NODE_SIZE = 5;

ToxiclibsSupport gfx;
NodeManager manager;

int DIM = 200;
// color transformation matrix used to map XYZ position into RGB values
Matrix4x4 colorMatrix = new Matrix4x4().scale(255f/(DIM*2)).translate(DIM,DIM,DIM);

// camera view target
Vec3D target = new Vec3D();
// camera offset
Vec3D eyeMod = new Vec3D(0,0,200);

void setup() {
  size(1024,576,OPENGL);
  gfx= new ToxiclibsSupport(this);
  manager = new NodeManager();
}

void draw() {
  background(255);
  // animate along Z
  float currZ=200*sin(frameCount*0.01);
  float currY=-frameCount;

  // smoothly update view target based on mouse position
  target.interpolateToSelf(new Vec3D(mouseX-width/2,currY,currZ),0.05);
  Vec3D eyePos=target.add(eyeMod);
  camera(eyePos.x,eyePos.y,eyePos.z,target.x,target.y,target.z,0,-1,0);
  
  manager.run();
  
  translate(target.x,target.y,target.z);
  box(10);
  
  if(random(100) < 10) {
    manager.add(target.copy());
  }
    
} 
