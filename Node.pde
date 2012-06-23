
class Node {
  Vec3D loc;
  Vec3D vel;
  Vec3D acc;

  float maxforce;
  float maxspeed;
  
  Node(Vec3D location) {
    loc = location;
    vel = Vec3D.randomVector();
  }
  
  void run() {
    render();
  }
  
  void render() {
    Vec3D col=colorMatrix.applyTo(loc);
    fill(col.x,col.y,col.z);
    gfx.cone(new Cone(loc,vel,0,NODE_SIZE,NODE_SIZE*4),5,false);
  }
}
