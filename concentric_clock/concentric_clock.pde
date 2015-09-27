// Hecho en Processing 3
// Juan José Castro
// 201415057

boolean start = true;
int iR = -110; // inner clock radius

// SECOND hand variables
float lastS = 0;
float angS = 0;
boolean setS = false;

// MINUTE hand variables
float lastM = 0;
float angM = 0;
boolean setM = false;

// HOUR hand variables
float lastH = 0;
float angH = 0;
boolean setH = false;


void setup() {
  size(500, 500);
  noStroke();
  background(255);
  pixelDensity(displayDensity());
}


void draw() {
  
  int hour = hour() % 12; // use 12 hour clock
  if (hour == 0) hour = 12; // resets hour hand
  translate(width/2, height/2); // move to center
  
  // ------------------------------
  // DRAW TIME AT START
  // ------------------------------
  
  // when starting the sketch
  if(start) {
    // draw the hour indicators
    for(int a = 0; a < 360; a += 30) {
      pushMatrix();
        fill(200);
        rotate(radians(a));
        rect(0, iR-80, 8, 15);
      popMatrix();
    }
    // draw up to current SECOND
    for(float s = 0; s < second()*6; s += 0.1 ) {
      pushMatrix();
      rotate(radians(s));
      drawS(false);
      popMatrix();
    }
    // draw up to current MINUTE
    for(float m = 0; m < minute()*6; m += 0.1 ) {
      pushMatrix();
      rotate(radians(m));
      drawM(false);
      popMatrix();
    }
    // draw up to current HOUR
    for(float h = 0; h < hour*30; h += 0.1 ) {
      pushMatrix();
      rotate(radians(h));
      drawH(false);
      popMatrix();
    }
    start = false;
  }
  
  // ------------------------------
  // SETUP AND CLEANING
  // ------------------------------
  
  // setup SECOND hand
  if(lastS != second()) {
    lastS = second();
    angS = (lastS-1)*6.0;
    setS = true;
    
    // clean up if full circle
    if(second() == 1) {
      for(float s = 0; s < 360; s += 0.1 ) {
        pushMatrix();
        rotate(radians(s));
        drawS(true);
        popMatrix();
      }
    }
  }
  
  // setup MINUTE hand
  if(lastM != minute()) {
    lastM = minute();
    angM = (lastM-1)*6.0;
    setM = true;
    
    // clean up if full circle
    if(minute() == 1) {
      for(float s = 0; s < 360; s += 0.1 ) {
        pushMatrix();
        rotate(radians(s));
        drawM(true);
        popMatrix();
      }
    }
  }
  
  // setup HOUR hand
  if(lastH != hour) {
    lastH = hour;
    angH = (lastH-1)*30.0;
    setH = true;
    
    // clean up if full circle
    if(hour == 1) {
      for(float s = 0; s < 360; s += 0.1 ) {
        pushMatrix();
        rotate(radians(s));
        drawH(true);
        popMatrix();
      }
    }
  }
  
  // ------------------------------
  // DRAW HANDS AT ANGLE
  // ------------------------------
  
  // draw SECOND hand
  pushMatrix();
    rotate(radians(angS));
    drawS(false);
  popMatrix();
  
  // draw MINUTE hand
  pushMatrix();
    rotate(radians(angM));
    drawM(false);
  popMatrix();
  
  // draw HOUR hand
  pushMatrix();
    rotate(radians(angH));
    drawH(false);
  popMatrix();
  
  // ------------------------------
  // SMOOTH TRANSITIONS
  // ------------------------------
  
  // move SECOND hand
  if(setS) {
    float dif = angS - (lastS*6);
    if(abs(dif) > 0.01)
      angS = angS - dif/10.0;
    else
      setS = false;
  }
  
  // move MINUTE hand
  if(setM) {
    float dif = angM - (lastM*6);
    if(abs(dif) > 0.01)
      angM = angM - dif/10.0;
    else
      setM = false;
  }
  
  // move HOUR hand
  if(setH) {
    float dif = angH - (lastH*30);
    if(abs(dif) > 0.01)
      angH = angH - dif/60.0;
    else
      setH = false;
  }
}

// draws the SECOND hand
void drawS(boolean clean) {
  if(clean) {
    fill(255);
    rect(0, iR-43, 2, 15);
  }
  else {
    fill(150);
    rect(0, iR-42, 2, 14);
  }
}

// draws the MINUTE hand
void drawM(boolean clean) {
  if(clean) {
    fill(255);
    rect(0, iR - 29, 2, 29);
  }
  else {
    fill(100);
    rect(0, iR - 28, 2, 28);
  }
}

// draws the HOUR hand
void drawH(boolean clean) {
  if(clean) {
    fill(255);
    rect(0, iR - 1, 2, 57);
  }
  else {
    fill(50);
    rect(0, iR, 2, 56);
  }
}