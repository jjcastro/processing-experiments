PFont font;

void setup() {
  size(500, 500);
  noStroke();
  
  font = loadFont("AvenirNext-Medium-48.vlw");
  textFont(font, 14);
}

void draw() {
  background(255);
  
  fill(230, 20, 0);
  
  ellipse(mouseX, mouseY, 5, 5);
  text(mouseX + ", " + mouseY, mouseX + 5, mouseY - 5);
  
  
}