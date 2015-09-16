// Hecho en Processing 3
// Juan José Castro - 201415057

// --- COLORES ---
final color BEIGE = color(238, 222, 186);
final color BLACK = color(0);
final color SALMON = color(215, 105, 97);

// --- VARIABLES GLOBALES ---
float len; // ancho de unidad
float bor; // ancho del borde (len / 2)

void setup() {
  // proporción - 7:10
  size(448, 640);
  background(0);
  noStroke();
  // pixelDensity(2);
}

// 27 cuadrados de ancho + 1/2 de borde a cada lado
// 39 cuadrados de alto  + 1/2 de borde a cada lado
void draw() {
  len = height / 40.0;
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
  int sX  - posición del rectángulo en X como múltiplo de len
  int sy  - inicio de los rectángulos en Y como múltiplo de len
  int w   - ancho de los rectángulos
  int rep - número de repeticiones
  color c - color del rectángulo [BLACK, BEIGE, SALMON]
*/
void drawDown(int sX, int sY, int w, int rep, color c) {
  fill(c);
  for(float i = 0, pY = (sY*len)+bor; i < rep; pY += len*2, i++) {
    rect((sX*len) + bor, pY, w*len, len);
  }
}