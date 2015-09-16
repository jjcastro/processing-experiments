int[] x;
int[] y;

int quantity = 1000;

void setup() {
  size(500, 500);
  x = new int[quantity];
  y = new int[quantity];
  fill(0);
  
  for(int i = 0; i < quantity; i++) {
    x[i] = (int)random(width);
    y[i] = (int)random(height);
  }
}

void draw() {
  background(255);
 
  for(int i = 0; i < quantity; i++) {
    rect(x[i], y[i], 5, 5);
    x[i] += (int) random(-5, 5);
    y[i] += (int) random(-5, 5);
  }
}