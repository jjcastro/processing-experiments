
// GLOBAL VARIABLES ----------------------

float x = 0;
boolean bckwrds = false;
color c, i;
color treeG1, treeG2, treeB;
color moun1, moun2;
color snow, flower;

int flowerNum = 50;
float[] xPosFlowers = new float[flowerNum];
float[] yPosFlowers = new float[flowerNum];

// snow variables
int quantity = 80;
float[] xPosition = new float[quantity];
float[] yPosition = new float[quantity];
int[] flakeSize = new int[quantity];
int[] direction = new int[quantity];
int minFlakeSize = 1;
int maxFlakeSize = 6;

void setup() {
   size(500, 500);
   noStroke();
   pixelDensity(2);
   
  for(int i = 0; i < quantity; i++) {
    flakeSize[i] = round(random(minFlakeSize, maxFlakeSize));
    xPosition[i] = random(0, width);
    yPosition[i] = random(0, height);
    direction[i] = round(random(0, 1));
  }
  
  for(int i = 0; i < flowerNum; i++) {
    xPosFlowers[i] = random(5, 495);
    yPosFlowers[i] = random(390, 495);
  }
}

void draw() {
  
  // SKY ----------------------------------
  
  if(x < 20) {
    background(62, 70, 98);
  }
  if(x > 20 && x < 80) {
    background(map(x, 20, 80, 62, 255),
               map(x, 20, 80, 70, 168),
               map(x, 20, 80, 98, 80));
  }
  if(x > 80 && x < 120) {
    background(map(x, 80, 120, 255, 66),
               map(x, 80, 120, 168, 186),
               map(x, 80, 120, 80, 242));
  }
  if(x > 120 && x < 380) {
    background(map(x, 120, 380, 66, 198),
               map(x, 120, 380, 186, 235),
               map(x, 120, 380, 242, 252));
  }
  if(x > 380 && x < 420) {
    background(map(x, 380, 420, 198, 252),
               map(x, 380, 420, 235, 252),
               map(x, 380, 420, 252, 198));
  }
  if(x > 420 && x < 480) {
    background(map(x, 420, 480, 252, 62),
               map(x, 420, 480, 252, 70),
               map(x, 420, 480, 198, 98));
  }
  if(x >480) {
    background(62, 70, 98);
  }
  
  
  // SUN ------------------------------
  
  fill(255, 210, 72);
  
  polygon(x, 
          450 - (250*abs(sin(map(x, 0, 500, 0, PI)))),
          40 + (30*sin(map(x, 0, 500, 0, PI))), 
          8, 
          x/50.0);          
            
  fill(250, 240, 87);
  
  polygon(x, 
          450 - (250*abs(sin(map(x, 0, 500, 0, PI)))),
          30 + (30*sin(map(x, 0, 500, 0, PI))), 
          6, 
          x/50.0);
  
  
  // COLOR TRANSITIONS ----------------------------
  
  if(x < 250) {
    c = color(220);
    i = color(150, 150, 150, 0);
  }
  if(x>250 && x<280) {
    i = color(150, 150, 150, map(x, 250, 280, 0, 260));
    c = color(map(x, 250, 280, 220, 180));
  }
  
  if(x<180) {
    treeG1 = color(85, 138, 64);
    treeG2 = color(103, 174, 74);
    treeB = color(151, 70, 40);
    moun1 = color(146, 152, 57);
    moun2 = color(185, 192, 88);
    flower = color(200, 57, 57);
  }
  if(x>180 && x<210){
    treeG1 = color(map(x, 180, 210, 85, 212),
                   map(x, 180, 210, 138, 158),
                   map(x, 180, 210, 64, 63));
    treeG2 = color(map(x, 180, 210, 103, 240),
                   map(x, 180, 210, 174, 170),
                   map(x, 180, 210, 74, 47));
    moun1 =  color(map(x, 180, 210, 146, 153),
                   map(x, 180, 210, 152, 148),
                   map(x, 180, 210, 57, 101));
    moun2 =  color(map(x, 180, 210, 185, 189),
                   map(x, 180, 210, 192, 181),
                   map(x, 180, 210, 88, 108));
    flower =  color(200, 57, 57,
                   map(x, 180, 209, 255, 0));                   
  }
  if(x>210) {
    flower = color(200, 57, 57, 0);
  }
  if(x>210 && x<290) {
    moun1 = color(153, 148, 101);
    moun2 = color(189, 181, 108);
  }
  if(x>270) {
    treeG1 = color(212, 158, 63,
                   map(x, 270, 290, 255, 0));
    treeG2 = color(240, 170, 47,
                   map(x, 270, 290, 255, 0));
    treeB = color(map(x, 270, 290, 151, 81),
                  map(x, 270, 290, 70, 66),
                  map(x, 270, 290, 40, 43));
  }
  if(x > 290) {
    treeB = color(81, 66, 43);
    if(x < 310) {
      moun1 = color(map(x, 290, 310, 153, 215),
                    map(x, 290, 310, 148, 215),
                    map(x, 290, 310, 101, 215));
      moun2 = color(map(x, 290, 310, 189, 245),
                    map(x, 290, 310, 181, 245),
                    map(x, 290, 310, 108, 245));
    
    } if (x > 310) {
      moun1 = color(215);
      moun2 = color(245);
    }
  }
  
  
  // CLOUDS AND MOUNTAINS -------------
  
  cloud(150, 43, c, x);
  cloud(50, 100, c, x/1.3);
  cloud(200, 200, c, x/1.5);
  cloud(-50, 220, c, x/1.2);
  cloud(-150, 80, c, x/1.5);
  cloud(-250, 220, c, x/1.4);
  cloud(300, 120, c, x);
  cloud(20, 320, c, x);
  cloud(-180, 300, c, x/1.1);
  cloud(360, 300, c, x/1.1);
  
  cloud(-190, 170, i, x/1.1);
  cloud(20, 20, i, x);
  cloud(-150, 35, i, x/1.1);
  cloud(50, 180, i, x/1.2);
  cloud(250, 100, i, x/1.4);
  cloud(25, 290, i, x/1.4);
  cloud(200, 290, i, x/1.1);
  cloud(-320, 290, i, x/1.3);
  
  mountains(moun1, moun2);
  
  
  // TREE ----------------------------
  
  tree(320, 280, treeB);
  
  fill(treeG1);
  polygon(322, 250, 38, 8, HALF_PI/6);
  
  fill(treeG2);
  polygon(370, 247, 47, 9, 0);
  
  
  // FLOWERS  ----------------------
  
  fill(flower);
  
  for(int j = 0; j < xPosFlowers.length; j++) {
    polygon(xPosFlowers[j], yPosFlowers[j], 5, 3, x/50.0);
    polygon(xPosFlowers[j], yPosFlowers[j], 5, 3, x/50.0 + PI);
  }
  
  
  // SNOW ----------------------------
  
  if(x<250) {
    snow = color(255,255,255, 0);
  }
  if(x>250 && x < 260) {
    snow = color(255,255,255, map(x, 250, 260, 0, 255));
  }
  if(x>260) {
    snow = color(255,255,255);
  }
  
  fill(snow);
   for(int i = 0; i < xPosition.length; i++) {
    
    polygon(xPosition[i], yPosition[i], flakeSize[i], 4, 0);
    
    if(direction[i] == 0) {
      xPosition[i] += map(flakeSize[i], minFlakeSize, maxFlakeSize, .1, .5);
    } else {
      xPosition[i] -= map(flakeSize[i], minFlakeSize, maxFlakeSize, .1, .5);
    }
    
    yPosition[i] += flakeSize[i] + direction[i]; 
    
    if(xPosition[i] > width + flakeSize[i] || xPosition[i] < -flakeSize[i] || yPosition[i] > height + flakeSize[i]) {
      xPosition[i] = random(0, width);
      yPosition[i] = -flakeSize[i];
    }
  }
  
  
  // STEPPER --------------------
  
  if(x>500) bckwrds = true;
  if(x<0) bckwrds = false;
  
  if(bckwrds) x--;
  else x++;
}


// FUNCTIONS -------------------

void mountains(color c1, color c2) {
  fill(c1);
  beginShape();
    vertex(0, 500);
    vertex(500, 500);
    vertex(500, 400);
    vertex(330, 330);
    vertex(0, 385);
  endShape();
  
  fill(c2); // verde claro montaña
  
  beginShape();
    vertex(0, 500);
    vertex(500, 500);
    vertex(500, 360);
    vertex(400, 340);
    vertex(160, 375);
    vertex(0, 390);
  endShape();
}

void polygon(float x, float y, float radius, int n, float angle)
{
  float divAngle = TWO_PI / n;
  beginShape();
  for (float a = 0; a < TWO_PI; a += divAngle) {
    float sx = x + cos(a + angle) * radius;
    float sy = y + sin(a + angle) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

void cloud(float x, float y, color c, float step) {
  fill(c);
  polygon(x - 22 + step, y + 7,  18, 6, 0);
  polygon(x + step,      y,      26, 6,  0);
  polygon(x + 22 + step, y + 7,  18, 6, 0);
}

void tree(float x, float y, color c) {
  
  float sF = 0.4; // size factor
  fill(c);
  beginShape();
    vertex(x+29*sF,  y+230*sF);
    vertex(x+138*sF, y+223*sF);
    vertex(x+118*sF, y+94*sF );
    vertex(x+118*sF, y+48*sF );
    
    vertex(x+145*sF, y+0*sF );
    vertex(x+116*sF, y+0*sF );
    vertex(x+83*sF, y+48*sF );
    vertex(x+72*sF, y+48*sF );
    vertex(x+66*sF, y+6*sF );
    vertex(x+45*sF, y+6*sF );
    vertex(x+42*sF, y+40*sF );
    vertex(x+23*sF, y+0*sF );
    
    vertex(x+0*sF,  y+0*sF);
    vertex(x+40*sF, y+78*sF);
    vertex(x+63*sF,  y+95*sF );
    vertex(x+50*sF,  y+203*sF);
  endShape();
}