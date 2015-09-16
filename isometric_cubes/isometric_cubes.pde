// Hecho en Processing 3
// Juan José Castro - 201415057

background(50, 172, 164); // fondo azul #32aca4
size(500, 500);
pixelDensity(2);
noStroke();

int w = 106; // ancho total del cubo
int h = 86; // altura de la base
int hi = 34; // altura de la cara superior

int row = 1; // fila actual

for(int y = 0; y < height; y += h) {
  
  // desplaza las filas pares 50 pixeles a la izq.
  for(int x = ((row % 2 == 0) ? -(w/2) : 0); x < width; x += w) {
    
    // crea los paralelepípedos blancos
    fill(254, 249, 230); // blanco crema #fef9e6
    quad(x, (hi/2) + y,
         x + (w/2), 0 + y,
         x + w, (hi/2) + y,
         x + (w/2), hi + y);
    
    // crea los paralelepípedos verdes
    fill(11, 126, 31); // verde oscuro #0b7e83
    quad(x, (hi/2) + y,
         x + (w/2), hi + y,
         x + (w/2), hi + y + (h - (hi/2)),
         x, (hi/2) + y + (h - (hi/2)));
    }
  
  row++;
}