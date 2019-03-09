import java.util.List;

void setup() {
  size(800, 600);

  noFill();
  strokeWeight(2);
  strokeJoin(MITER);
  
  pushMatrix();
  translate(width/2, height/2);

  List<PVector> vL = staircase(10, 16, 16);
  for (float i = 0; i < 2 * PI; i += PI / 8){
    drawVectorList(vL);
    rotate(PI/8);
  }

  popMatrix();  
}

List<PVector> staircase (int numSteps, int stepWidth, int stepHeight) {
  List<PVector> vectorList = new ArrayList<PVector>();
  
  PVector p1, p2;
  p1 = new PVector(0, 0);
  p2 = new PVector();

  vectorList.add(p1.copy());
  for (int i = 0; i < numSteps; i++){
    int w = i%2 == 0 ? stepWidth : 0;
    int h = i%2 == 0 ? 0 : stepHeight;
    p2.set(p1.x + w, p1.y - h);
    p1 = p2.copy();

    vectorList.add(p2.copy());    
  }
  return vectorList;
}

void drawVectorList(List<PVector> vectorList) {
  beginShape();
  for (PVector v : vectorList) {
    vertex(v.x, v.y);
  }
  endShape();
}
