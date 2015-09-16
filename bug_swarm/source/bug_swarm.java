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

public class bug_swarm extends PApplet {

int[] x;
int[] y;

int quantity = 1000;

public void setup() {
  
  x = new int[quantity];
  y = new int[quantity];
  fill(0);
  
  for(int i = 0; i < quantity; i++) {
    x[i] = (int)random(width);
    y[i] = (int)random(height);
  }
}

public void draw() {
  background(255);
 
  for(int i = 0; i < quantity; i++) {
    rect(x[i], y[i], 5, 5);
    x[i] += (int) random(-5, 5);
    y[i] += (int) random(-5, 5);
  }
}
  public void settings() {  size(500, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "bug_swarm" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
