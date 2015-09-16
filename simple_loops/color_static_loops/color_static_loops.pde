
void setup() {
  size(500, 500);
  background(255);
  frameRate(10);
  noStroke();
}


void draw() {
  int l = 10;
  
  for(int y = 0; y < height; y += l) {
    for(int x = 0; x < width; x += l ) {
      fill(random(255), random(255), 100);
      rect(x, y, l, l);
    }
  }
}


