PFont font;
int panelWidth = 110;

boolean drawingPoint = true;
int selectedWeight = 2;

color currentStroke = 0;

Button borrar;
IconButton pencil, circles;

IconButton stroke1, stroke2, stroke3;

IconButton pressed = pencil;
IconButton pressedStroke = stroke1;

void setup() {
  font = loadFont("ChicagoBold-16.vlw");
  textFont(font, 16);
  size(650, 500);
  background(255);
  
  Iconable iconPencil = new Iconable() {
    public void drawIcon(int x, int y) {
      float xOff = 8, yOff = 10;
      
      fill(249, 171, 255);
      ellipse(x + xOff + (21/2.0), y + yOff, 21, 11);
      
      fill(25, 182, 241);
      rect(x + xOff, y + yOff, 21, 15);
      rect(x + xOff, y + yOff, 14, 15);
      rect(x + xOff, y + yOff, 7, 15);
      
      fill(250, 227, 101);
      triangle(x + xOff, y + yOff + 15,
               x + xOff + 21, y + yOff + 15,
               x + xOff + (21/2.0), y + yOff + 15 + 7);
      fill(0);
      
      triangle(x + xOff + (21/2.0), y + yOff + 15 + 7,
               x + xOff + (21/2.0) + 2, y + yOff + 15 + 7 - 2,
               x + xOff + (21/2.0) - 2, y + yOff + 15 + 7 - 2);
    }
  };
  
  Iconable iconCircles = new Iconable() {
    public void drawIcon(int x, int y) {
      strokeWeight(3);
      noFill();
      
      stroke(255, 20, 5);
      ellipse(x + 22, y + 22, 10, 10);
      
      stroke(0, 0, 255);
      ellipse(x + 16, y + 16, 15, 15);
      
      stroke(0);
      strokeWeight(1);
    }
  };
  
  Iconable iconStroke1 = new Iconable() {
    public void drawIcon(int x, int y) {
      strokeWeight(1);
      line(x + 10, y + 7, x + 70, y + 7);
      strokeWeight(1);
    }
  };
  
  Iconable iconStroke2 = new Iconable() {
    public void drawIcon(int x, int y) {
      strokeWeight(2);
      line(x + 10, y + 7, x + 70, y + 7);
      strokeWeight(1);
    }
  };
  
  Iconable iconStroke3 = new Iconable() {
    public void drawIcon(int x, int y) {
      strokeWeight(4);
      line(x + 10, y + 7, x + 70, y + 7);
      strokeWeight(1);
    }
  };
  
  pencil = new IconButton(iconPencil, 14, 60, 36, 36);
  circles = new IconButton(iconCircles, 58, 60, 36, 36);
  
  stroke1 = new IconButton(iconStroke1, 14, 120, 80, 15);
  stroke2 = new IconButton(iconStroke2, 14, 142, 80, 15);
  stroke3 = new IconButton(iconStroke3, 14, 164, 80, 15);
  
  pressed = pencil;
  pressedStroke = stroke1;
}

void draw() {
  
  // PANEL ----------------------
  
  stroke(0);
  fill(180);
  rect(0, 0, panelWidth, height);
  borrar = new Button("BORRAR", 14 , 12, 80, 27);
  
  pencil.drawButton(pencil == pressed);
  circles.drawButton(circles == pressed);
  
  stroke1.drawButton(pressedStroke == stroke1);
  stroke2.drawButton(pressedStroke == stroke2);
  stroke3.drawButton(pressedStroke == stroke3);
  
  colorPicker(15, 215);
  
  stroke(0);
  
  // DIBUJO ---------------------
  
  if(mousePressed && mouseX > panelWidth) {
    drawing();
  }
  
}

void mouseClicked() {
  if(borrar.over()) {
    clean();
  }
  else if(pencil.over()) {
    pressed = pencil;
  }
  else if(circles.over()) {
    pressed = circles;
  }
  else if(stroke1.over()) {
    pressedStroke = stroke1;
    selectedWeight = 1;
  }
  else if(stroke2.over()) {
    pressedStroke = stroke2;
    selectedWeight = 3;
  }
  else if(stroke3.over()) {
    pressedStroke = stroke3;
    selectedWeight = 4;
  }
  
}

void clean() {
  noStroke();
  fill(255);
  rect(panelWidth + 1, 0, 650, 500);
  stroke(1);
}

void drawing() {
  
  stroke(currentStroke);
  strokeWeight(selectedWeight);
  
  if(pressed == pencil) {
    line(mouseX, mouseY, pmouseX, pmouseY);
    strokeWeight(1);
  }
  else if(pressed == circles) {
    noFill();
    ellipse(mouseX, mouseY, 20, 20);
  }
  
  strokeWeight(1);
}

void colorPicker(int x, int y) {
  int w = 83;
  int h = 83;
  
  if(mousePressed && mouseX > x  &&
          mouseX < x + w &&
          mouseY > y &&
          mouseY < y + h) {
    colorMode(HSB, 83);
    currentStroke = color(mouseX - x + 1, mouseY - y + 1, 83);
    colorMode(RGB, 255);
  }
  
  fill(255);
  
  fill(currentStroke);
  rect(x, y - 14, w + 1, 10);
  rect(x, y, w + 1, h + 1);
  
  noStroke();
  colorMode(HSB, 83);
  for (int i = 0; i < 83; i++) {
    for (int j = 0; j < 83; j++) {
      stroke(i, j, 83);
      point(i + x + 1, j + y + 1);
    }
  }
  colorMode(RGB, 255);
}