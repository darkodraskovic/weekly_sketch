class Staircase {
  PShape s;
  
  Staircase(int numSteps, int stepWidth, int stepHeight, float noiseStep, int col) {
    List<PVector> vertexList = genVertexList(numSteps, stepWidth, stepHeight, noiseStep);
    s = genShape(vertexList, col);
  }

  List<PVector> genVertexList (int numSteps, int stepWidth, int stepHeight, float noiseStep) {
    List<PVector> vertexList = new ArrayList<PVector>();
  
    PVector p1, p2;
    p1 = new PVector(0, 0);
    p2 = new PVector();

    float xoff = 0.0;
    float yoff = 0.0;
  
    vertexList.add(p1.copy());
    for (int i = 0; i < numSteps; i++){
      xoff = xoff + noiseStep;
      yoff = yoff + noiseStep;
      float w = i%2 == 0 ? stepWidth*noise(xoff) : 0;
      float h = i%2 == 0 ? 0 : stepHeight*noise(yoff);
      p2.set(p1.x + w, p1.y - h);
      p1 = p2.copy();

      vertexList.add(p2.copy());    
    }
    return vertexList;
  }

  PShape genShape(List<PVector> vertexList, int col) {
    PShape s_ = createShape();
    s_.setStroke(color(col));
    s_.beginShape();
    for (PVector v : vertexList) {
      s_.vertex(v.x, v.y);
    }
    s_.endShape();

    return s_;
  }
  
  void display() {
    shape(s);
  }
}
