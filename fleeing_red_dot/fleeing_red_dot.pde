int pointX = 250, pointY = 250;

void setup() {
  size(500, 500);
  noStroke();
}

void draw() {
  background(255);
  
  fill(230, 20, 0);
  
  ellipse(pointX, pointY, 5, 5);
  
  if(abs(mouseY - pointY) < 20 &&
     abs(mouseX - pointX) < 20) {
    pointY -= mouseY - pointY;
    pointX -= mouseX - pointX;
  }
}