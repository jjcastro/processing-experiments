import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class anni_albers_textile extends PApplet {

// Hecho en Processing 3
// Juan Jos\u00e9 Castro - 201415057

// --- COLORES ---
final int BEIGE = color(238, 222, 186);
final int BLACK = color(0);
final int SALMON = color(215, 105, 97);

// --- VARIABLES GLOBALES ---
float len; // ancho de unidad
float bor; // ancho del borde (len / 2)

public void setup() {
  // proporci\u00f3n - 7:10
  
  background(0);
  noStroke();
  // pixelDensity(2);
}

// 27 cuadrados de ancho + 1/2 de borde a cada lado
// 39 cuadrados de alto  + 1/2 de borde a cada lado
public void draw() {
  len = height / 40.0f;
  bor = len / 2;
  
  fill(SALMON);
  rect(bor, bor, width - len, height - len);
  
  drawDown(1, 0, 5, 8, BEIGE);
  drawDown(4, 1, 15, 9, BLACK);
  drawDown(6, 3, 9, 4, SALMON);
  drawDown(17, 1, 1, 9, BEIGE);
  drawDown(0, 15, 11, 12, BLACK);
  drawDown(0, 16, 11, 11, BEIGE);
  drawDown(1, 16, 5, 4, SALMON);
  drawDown(1, 17, 3, 3, BEIGE);
  drawDown(7, 17, 1, 5, BEIGE);
  drawDown(7, 27, 1, 5, SALMON);
  drawDown(6, 28, 2, 4, BLACK);
  drawDown(20, 1, 1, 9, BLACK);
  drawDown(21, 2, 5, 7, BLACK);
  drawDown(24, 1, 3, 7, BLACK);
  drawDown(26, 0, 1, 8, BEIGE);
  drawDown(11, 15, 4, 2, BEIGE);
  drawDown(11, 19, 10, 5, BEIGE);
  drawDown(21, 16, 6, 6, BEIGE);
  drawDown(21, 15, 3, 7, BEIGE);
  drawDown(11, 28, 13, 5, BLACK);
  drawDown(11, 38, 13, 1, BEIGE);
  drawDown(11, 29, 4, 5, BLACK);
  drawDown(22, 29, 2, 5, BLACK);
  drawDown(0, 28, 6, 4, SALMON);
}

/* 
  --- PARAMETERS ---
  int sX  - posici\u00f3n del rect\u00e1ngulo en X como m\u00faltiplo de len
  int sy  - inicio de los rect\u00e1ngulos en Y como m\u00faltiplo de len
  int w   - ancho de los rect\u00e1ngulos
  int rep - n\u00famero de repeticiones
  color c - color del rect\u00e1ngulo [BLACK, BEIGE, SALMON]
*/
public void drawDown(int sX, int sY, int w, int rep, int c) {
  fill(c);
  for(float i = 0, pY = (sY*len)+bor; i < rep; pY += len*2, i++) {
    rect((sX*len) + bor, pY, w*len, len);
  }
}
  public void settings() {  size(448, 640); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "anni_albers_textile" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
