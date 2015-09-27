float mx = 0.0;
int amount = 40;
float[] xPos = new float[amount];
float[] yPos = new float[amount];

int c = 0;

void setup()
{
   size(400, 400);
   //cursor(CROSS);
   
   for(int i = 0; i < amount; i++) {
     xPos[i] = random(width);
     yPos[i] = random(height);
   }
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

void draw() {
  colorMode(HSB, 360, 100, 100);
  background(196,70,map(mx, 0, width, 20, 100));
  colorMode(RGB, 255);

  c = color(255, map(mx, 255, 265, 0, 255));
  cloud(150, 43, c, mx);
  cloud(50, 100, c, mx/1.3);
  cloud(200, 200, c, mx/1.5);
  cloud(-50, 220, c, mx/1.2);
  cloud(-150, 80, c, mx/1.5);
  cloud(-250, 220, c, mx/1.4);

  

  pushMatrix();
    fill(255, map(mx, 0, 255, 200, 0));
    for(int j = 0; j < xPos.length; j++) {
      polygon(xPos[j], yPos[j], 7, 3, millis()/500.0);
      polygon(xPos[j], yPos[j], 7, 3, millis()/500.0 + PI);
    }
    translate(width/2, height - mx/1.5);
    fill(255, 204, 36);
    polygon(0, 0, mx/4 + 30, 6, mx/40.0);
    fill(255, 236, 88);
    ellipse(0, 0, mx/2, mx/2);
  popMatrix();
  
  
  colorMode(HSB, 360, 100, 100);
  fill(93,68, map(mx, 0, width, 40, 96));
  colorMode(RGB, 255);
  
  pushMatrix();
    translate(-60, map(mx, 0, width, 30, -30));
    //scale(map(mx,0,500,0.5,1));
    
    triangle(0, 500, 200, 300, 400, 500);
    triangle(200, 500, 350, 350, 500, 500);
  popMatrix();
  
  // Actualiza a localización del marcador
  float dif = mouseX - mx;
  if(abs(dif) > 1.0) {
    mx = mx + dif/32.0;
  }
  // Mantiene el marcador en la pantalla
  mx = constrain(mx, 1, width-1);
  noStroke();
  // Dibuja el rectángulo inferior
  fill(255);
  rect(0, height-5, width, 5);
  // Dibuja el marcador de posición
  fill(204, 102, 0);
  rect(mx-2, height-5, 4, 5);
}