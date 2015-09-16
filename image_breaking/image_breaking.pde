PImage zebra;
int var = 0;

void setup() {
  size(1500, 1000);
  zebra = loadImage("zebra.jpg");
  background(255);
  noStroke();
}

void draw() {
  background(255);
  for(int y = 0; y < zebra.height; y++) {
    for(int x = 0; x < zebra.width; x++) {
      fill(zebra.pixels[y * zebra.width + x]);
      rect((x % 2 == 0 ? x + var : x)*2, y*2, 2, 2);
    }
  }
  var =6;
}