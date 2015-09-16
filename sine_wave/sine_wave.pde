// Simple sine wave of varying velocity

int x = 0;
int in;
boolean backwards = false;
float cut = 2000 / 3.0;
int thickness;
 
void setup() {
  size(1000, 500);
  noStroke();
  background(0);
  frameRate(60);
}

void draw() {
  
  
  
  rect(x,
       240 + 20*(backwards ? sin(x/20.0) : cos(x/20.0)),
       thickness,
       thickness);

  
  if(x >= 0 && x < cut) {
    in = 1;
    thickness = 3;
  } else if (x > cut && x < 2 * cut) {
    in = 5;
    thickness = 5;
  } else if (x > 2 * cut && x <= width) {
    in = 2;
    thickness = 1;
  }
  
  println(in);
  if(backwards) {x -= in;}
  else {x += in;}
  
  if(x > width - 20) {
    backwards = true;
  } else if (x < 0) {
    backwards = false;
  }
} 