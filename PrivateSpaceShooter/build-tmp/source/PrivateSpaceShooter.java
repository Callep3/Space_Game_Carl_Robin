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
	world.worldCreation();
	nexus.NexusSpawn();
}



boolean up, down, left, right;
class Input {

	public void keyPressed() {
		if(key == 'w') {
			up = true;
		}
		if(key == 's') {
			down = true;
		}
		if(key == 'a') {
			left = true;
		}
		if(key == 'd') {
			right = true;
		}
	}
	

}
class Nexus {

	public void NexusSpawn() {
		ellipseMode(CENTER);
		fill(0, 220, 0);
		ellipse(width/2, height/2, 150, 150);
	}
	
}
  
class Player {
	
}



class World {
	
	public void worldCreation() {
		strokeWeight(2);
		rectMode(CENTER);
		fill(255);
		rect(width/2, height/2, width, 10);
		rect(width/2, height/2, 10, height);


		//Nexus
		ellipseMode(CENTER);
		fill(0, 220, 0);
		ellipse(width/2, height/2, 150, 150);


		//jumpPoints
		fill(0, 255, 255);
		ellipse(width/4, height/4, 20, 20);
		ellipse(width/4*3, height/4, 20, 20);
		ellipse(width/4, height/4*3, 20, 20);
		ellipse(width/4*3, height/4*3, 20, 20);

		//fakePlayer
		fill(255, 255, 0 );
		ellipse(width/4, height/4, 30, 30);

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
