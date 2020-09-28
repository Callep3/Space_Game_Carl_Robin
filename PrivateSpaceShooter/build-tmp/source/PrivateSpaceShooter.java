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
Time myTime;
Player player;
Enemies myEnemy;
Enemies[] enemies;
int enemySize = 20;
float enemySpeed = 100.0f;

//cmon

public void setup() {
world = new World();
nexus = new Nexus();

background(0);
//Remove Before Pushing
surface.setLocation(-1923, 4);
myEnemy = new Enemies(random(-enemySize, width + enemySize), enemySize);
player = new Player(width / 4, height / 4);
myTime = new Time();
}

public void draw() {
	myTime.DeltaTime();
	world.worldCreation();
	nexus.NexusSpawn();
	player.update();
	player.draw();
	myEnemy.update();
	myEnemy.draw();
}


public class Enemies {
	PVector direction, position, velocity;
	int r, g, b;

	public Enemies(float x, float y) {
		position = new PVector(x, y);

		direction = new PVector(width/2 - position.x, height/2 - position.y).normalize();

		velocity = new PVector(direction.x, direction.y);
		velocity.x = velocity.x * deltaTime * enemySpeed;
		velocity.y = velocity.y * deltaTime * enemySpeed;

		r = 255;
		g = 0;
		b = 0;
	}

	public void update() {
		position.x += velocity.x;
		position.y += velocity.y;
	}

	public void draw() {
		ellipseMode(CENTER);
		fill(r, g, b);
		ellipse(position.x, position.y, enemySize, enemySize);
	}
}
boolean up, down, left, right;

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

	public void keyReleased() {
		if(key == 'w') {
			up = false;
		}
		if(key == 's') {
			down = false;
		}
		if(key == 'a') {
			left = false;
		}
		if(key == 'd') {
			right = false;
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
	PVector position;

	Player(float x, float y) {
		position = new PVector(x, y);
	}

	public void update() {
		if(down) {
			down();
		}
		movement();
	}


	public void draw() {
		fill(255, 255, 0 );
		ellipse(position.x, position.y, 30, 30);
	}

	public void movement() {

		//top-left
		//if (position.x == width/4 && position.y == height/4) {
		//	if(down) {
		//		position.y = height/4*3;
		//	}
		//	if(right) {
		//		position.x = width/4*3;
		//	}
		//}

		//top-right
		if (position.x == width/4*3 && position.y == height/4) {
			if(down) {
				position.y = height/4*3;
			}
			if(left) {
				position.x = width/4;
			}
		}

		//bottom-right
		if (position.x == width/4*3 && position.y == height/4*3) {
			if(up) {
				position.y = height/4;
			}
			if(left) {
				position.x = width/4;
			}
		}

		//bottom-left
		if (position.x == width/4 && position.y == height/4*3) {
			if(up) {
				position.y = height/4;
			}
			if(right) {
				position.x = width/4*3;
			}
		}
	}

	public void down() {
			if(position.y != height/4*3) {
				position.y += 3;
			}	
	}
}

float deltaTime = 0;
float time = 0;

public class Time 
{
	public void DeltaTime() 
	{
		long currentTime = millis();
	    deltaTime = (currentTime - time) * 0.001f;
	    time = currentTime;
	}
}

class World {
	
	public void worldCreation() {
		//Background
		background(0);


		//Lines
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
size(1920, 1014); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "PrivateSpaceShooter" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
