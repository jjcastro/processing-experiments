float[] x, y;
PFont font;

int quantity = 50;
int n = 2; // rango incremento-decremento

void setup() {
  pixelDensity(displayDensity());
  size(500, 500);
  
  stroke(0);
  smooth();
  
  x = new float[quantity];
  y = new float[quantity];
  
  font = loadFont("AvenirNext-Medium-48.vlw");
  textFont(font, 14);
  
  for(int i = 0; i < quantity; i++) {
    x[i] = random(width);
    y[i] = random(height);
  }
}

void draw() {
  background(255);
  
  fill(230, 20, 0);
  
  for(int i = 0; i < quantity; i++) {
    text(i, x[i] + 2, y[i] - 2);
    
    strokeWeight(3);
    point(x[i], y[i]);
    
    strokeWeight(1);
    if(i < quantity - 1) {
      line(x[i], y[i], x[i+1], y[i+1]);
    }
    
    x[i] += random(-n, n);
    y[i] += random(-n, n);
  }
  
  
}