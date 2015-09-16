// Hecho con Processing 3+

size(500, 500);
background(255);
noStroke();
pixelDensity(displayDensity());

int a = 5; // interval

for(int i = width; i > 0; i -= a) {
  if(i % 2 == 0) {
    fill(0);
  } else {
    fill(255);
  }

  ellipse(width/2, height/2, i, i);
}