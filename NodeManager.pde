
class NodeManager {
  
  ArrayList history;
  
  NodeManager() {
    history = new ArrayList();
  }
  
  
  void run() {
    for(Iterator i=history.iterator(); i.hasNext();) {
      Node p=(Node)i.next();
      p.run();
    }
    
    if(history.size() > 1000) {
      history.remove(0);
    }
  }
  
  void add(Vec3D target) {
    print(target + " ");
    Node n = new Node(target);
    history.add(n);
  }
}
