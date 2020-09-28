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

public class PrivateSpaceShooter extends PApplet {

World world;
Nexus nexus;


public void setup() {
world = new World();
nexus = new Nexus();

background(0);
}	

public void draw() {

	nexus.NexusSpawn();
}




class Nexus {

	public void NexusSpawn() {
		noStroke();
		ellipse(width/2, height/2, 300, 300);
	}
	
}
  





class World {
	
	public void worldCreation() {

	}	
}
  public void settings() { 
size(1920, 1080); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "PrivateSpaceShooter" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
