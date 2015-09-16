class Button {
  int bX, bY, bW, bH;
  String text;
  
  Button(){}
  
  Button(String text, int bX, int bY, int bW, int bH) {
    this.bX = bX; this.bY = bY;
    this.bW = bW; this.bH = bH;
    this.text = text;
    
    drawButton(null);
  }
  
  boolean over() {
    return (mouseX >= bX) &&
           (mouseX <= bX + bW) &&
           (mouseY >= bY) &&
           (mouseY <= bY + bH);
  }
  
  void drawButton(Iconable icon) {
    int depth = 2;
   
    fill(0);
    rect(bX + depth, bY + depth, bW, bH);
    
    if(over() && mousePressed) {
      fill(200);
      rect(bX + depth, bY + depth, bW, bH);
      fill(0);
      text(text, bX + 8 + depth, bY + 20 + depth);
    } else {
      fill(200);
      rect(bX, bY, bW, bH);
      fill(0);
      text(text, bX + 8, bY + 20);
    }
  }
}

interface Iconable {
  void drawIcon(int x, int y);
}

class IconButton extends Button {
  
  Iconable icon;
  
  IconButton(Iconable icon, int bX, int bY, int bW, int bH) {
    this.bX = bX; this.bY = bY;
    this.bW = bW; this.bH = bH;
    this.icon = icon;
  }
  
  void drawButton(boolean pressed) {
    int depth = 2;
   
    fill(0);
    rect(bX + depth, bY + depth, bW, bH);
    
    color bkg;
    
    if(pressed) bkg = color(255, 255, 0);
    else bkg = color(200);
    
    if(pressed || (over() && mousePressed)) {
      fill(bkg);
      rect(bX + depth, bY + depth, bW, bH);
      fill(0);
      icon.drawIcon(bX + depth, bY + depth);
    } else {
      fill(bkg);
      rect(bX, bY, bW, bH);
      fill(0);
      icon.drawIcon(bX, bY);
    }
  }
}