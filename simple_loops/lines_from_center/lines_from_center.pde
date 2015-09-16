size(500, 500);
background(255);
pixelDensity(2);

int a = 5; // interval

for(int i = 0; i < width + 1; i += a) {
  line(i, 0, width/2, height/2);
  line(i, height, width/2, height/2);
  line(0, i, width/2, height/2);
  line(width, i, width/2, height/2);
}