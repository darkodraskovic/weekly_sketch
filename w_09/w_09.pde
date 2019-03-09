import java.util.List;

void setup() {
  size(600, 600);
  background(0);
  noFill();


  strokeWeight(2);
  strokeJoin(MITER);
  
  int numSteps = 10;
  int numStaircases = 16;
  float angleStep =  (2 * PI) / numStaircases;
  int stepLen = 56;
  int nSeed = 0;
  float noiseStep = 0.075;

  List<Integer> colors = new ArrayList<Integer>();
  int numShades = 4;
  int shadeStep = 255/numShades;
  colorMode(RGB, numShades);
  for (int i = 1; i <= numShades; i++){
    colors.add(color(numShades, 0, 0, i));
  }

  List<Staircase> staircases = new ArrayList<Staircase>();
  for (Integer c : colors) {
    for (int i = 0; i < numStaircases; i++){
      noiseSeed(nSeed++);
      Staircase s = new Staircase(numSteps, stepLen, stepLen, noiseStep, c);
      staircases.add(s);
    }
  }

  pushMatrix();
  translate(width/2, height/2);
  for (Staircase s : staircases) {
    rotate(angleStep);
    s.display();
  }    
  popMatrix();

  save("output.png");  
}
