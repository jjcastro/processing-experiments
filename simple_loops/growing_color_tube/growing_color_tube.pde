size(500, 500);
background(255);
noStroke();

int x = 10;

while(x < 2000) {
  fill(random(255), random(255), random(255));
  ellipse(x, x, x, x);
  x += x/10;
}
