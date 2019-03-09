import java.util.List;

void setup() {
  size(600, 600);
  background(0);
  noFill();


  strokeWeight(2);
  strokeJoin(MITER);
  
  pushMatrix();
  translate(width/2, height/2);

  int numStaircases = 16;
  float angleStep =  (2 * PI) / numStaircases;
  int stepLen = 56;

  stroke(255, 0, 0);  
  for (int i = 0; i < numStaircases; i++){
    noiseSeed(i);
    drawVectorList(staircase(10, stepLen, stepLen, .075));
    rotate(angleStep);
  }
  save("red.png");

  background(0);
  stroke(0, 255, 0);
  for (int i = 0; i < numStaircases; i++){
    noiseSeed(i+3);
    drawVectorList(staircase(10, stepLen, stepLen, .075));
    rotate(angleStep);
  }
  save("green.png");

  popMatrix();
  
}

List<PVector> staircase (int numSteps, int stepWidth, int stepHeight, float noiseStep) {
  List<PVector> vectorList = new ArrayList<PVector>();
  
  PVector p1, p2;
  p1 = new PVector(0, 0);
  p2 = new PVector();

  float xoff = 0.0;
  float yoff = 0.0;
  
  vectorList.add(p1.copy());
  for (int i = 0; i < numSteps; i++){
    xoff = xoff + noiseStep;
    yoff = yoff + noiseStep;
    float w = i%2 == 0 ? stepWidth*noise(xoff) : 0;
    float h = i%2 == 0 ? 0 : stepHeight*noise(yoff);
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
