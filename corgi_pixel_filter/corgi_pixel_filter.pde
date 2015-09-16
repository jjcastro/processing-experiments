PImage imagen;  // imagen
int[] px;       // arreglo de píxeles de la imagen

int cut = 15;   // intervalo mínimo de cambio
int buzz;       // medida de ruido de los pixeles
int len, w, h;  // longitud, ancho y alto de la imagen

void setup() {
  // IMPORTANTE: alto y ancho debe coincidir con imagen
  size(500, 500); 
  
  // carga la imagen
  imagen = loadImage("corgi.jpg");
  imagen.loadPixels();
  
  // carga las características de la imagen
  px = imagen.pixels;
  len = px.length;
  
  w = imagen.width;
  h = imagen.height;
  
  // cierra el sketch si no coinciden h y w
  if(width != w || height != h) {
    println("¡ALTO Y ANCHO DE CANVAS DEBE COINCIDIR CON LA IMAGEN!");
    println("CERRANDO.");
    System.exit(0);
  }
  
  noStroke();
}

void draw() {
  // muestra fps en la ventana
  surface.setTitle(int(frameRate) + " fps");
  
  // Calcular la distancia entre el mouse y el centro
  int d = (int)sqrt(sq((mouseX - (width / 2.0))) +
                    sq((mouseY - (height / 2.0))));
    
  // si la distancia es mayor al corte mínimo
  if(d > cut) {
    // calcula el zumbido de los píxeles
    int buzz = (int)map(d, 0, 100, 1, 5);
    
    // dibuja el arreglo de píxeles
    for (int j = 0; j < h; j++) {
      for (int i = 0; i < w; i++) {
        int pos = j * w + i;
        int rPos = ((int)(j + random(-buzz, buzz))) * w +
                     ((int)(i + random(0, buzz)));
                     
        // si está en el arreglo, zumba el pixel en el rango
        fill(px[ rPos < 0 || rPos > len - 1 ? pos : rPos]);
        
        // dibuja según el intervalo de corte
        // y la distancia al centro
        if(i % ((2*d)/cut + 1) == 0 &&
           j % ((2*d)/cut + 1) == 0) {
          rect(i, j, 100, 100);
        }
      }
    }
  } else { // si la distancia es menor al corte
    // dibuja la imagen sin cambios
    for (int j = 0; j < h; j++) {
      for (int i = 0; i < w; i++) {
        fill(px[j * w + i]);
        rect(i, j, 2, 2);
      }
    }
  }
}