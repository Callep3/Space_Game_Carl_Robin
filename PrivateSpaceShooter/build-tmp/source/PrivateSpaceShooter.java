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
boolean up, down, left, right, moveAnimation;

	public void keyPressed() {
		if(key == 'w' && moveAnimation == false) {
			up = true;
			moveAnimation = true;
		}
		if(key == 's' && moveAnimation == false) {
			down = true;
			moveAnimation = true;
		}
		if(key == 'a' && moveAnimation == false) {
			left = true;
			moveAnimation = true;
		}
		if(key == 'd' && moveAnimation == false) {
			right = true;
			moveAnimation = true;
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
	PVector position, topLeft, topRight, btmLeft, btmRight;
	boolean topLeftPoint, topRightPoint, btmRightPoint, btmLeftPoint;
	float speed = 2000;


	Player(float x, float y) {
		topLeft = new PVector(width/4*1.4f, height/4);
		btmLeft = new PVector(width/4*1.4f, height/4*3);
		topRight = new PVector(width/4*2.6f, height/4);
		btmRight = new PVector(width/4*2.6f, height/4*3);
		position = new PVector(topLeft.x, topLeft.y);
	}


	public void update() {
		movement();
	}


	public void draw() {
		fill(255, 255, 0 );
		ellipse(position.x, position.y, 30, 30);
	}


	public void movement() {
		//Check at whick point the player is currently at.
		if(position.x == topLeft.x && position.y == topLeft.y) {
			topLeftPoint = true;
		}
		if(position.x == topRight.x && position.y == topRight.y) {
			topRightPoint = true;
		}
		if(position.x == btmLeft.x && position.y == btmLeft.y) {
			btmLeftPoint = true;
		}
		if(position.x == btmRight.x && position.y == btmRight.y) {
			btmRightPoint = true;
		}

		//top-left Point
		if(down && topLeftPoint) {
			if(moveAnimation) {
				position.y += speed * deltaTime;
			}
			if(position.y >= btmLeft.y) {
				position.y = btmLeft.y;
				down = false;
				topLeftPoint = false;
				moveAnimation = false;
			}
		}
		if(right && topLeftPoint) {
			if(moveAnimation) {
				position.x += speed * deltaTime;
			}
			if(position.x >= btmRight.x) {
				position.x = btmRight.x;
				right = false;
				topLeftPoint = false;
				moveAnimation = false;
			}
		}

		//top-right Point
		if(down && topRightPoint) {
			if(moveAnimation) {
				position.y += speed * deltaTime;
			}
			if(position.y >= btmRight.y) {
				position.y = btmRight.y;
				down = false;
				topRightPoint = false;
				moveAnimation = false;
			}
		}
		if(left && topRightPoint) {
			if(moveAnimation) {
				position.x -= speed * deltaTime;
			}
			if(position.x <= topLeft.x) {
				position.x = topLeft.x;
				left = false;
				topRightPoint = false;
				moveAnimation = false;
			}
		}


		//bottom-right Point
		if(up && btmRightPoint) {
			if(moveAnimation) {
				position.y -= speed * deltaTime;
			}
			if(position.y <= topRight.y) {
				position.y = topRight.y;
				up = false;
				btmRightPoint = false;
				moveAnimation = false;
			}
		}
		if(left && btmRightPoint) {
			if(moveAnimation) {
				position.x -= speed * deltaTime;
			}
			if(position.x <= btmLeft.x) {
				position.x = btmLeft.x;
				left = false;
				btmRightPoint = false;
				moveAnimation = false;
			}
		}

		//bottom-left Point
		if(up && btmLeftPoint) {
			if(moveAnimation) {
				position.y -= speed * deltaTime;
			}
			if(position.y <= topLeft.y) {
				position.y = topLeft.y;
				up = false;
				btmLeftPoint = false;
				moveAnimation = false;
			}
		} 
		if(right && btmLeftPoint) {
			if(moveAnimation) {
				position.x += speed * deltaTime;
			}
			if(position.x >= btmRight.x) {
				position.x = btmRight.x;
				right = false;
				btmLeftPoint = false;
				moveAnimation = false;
			}
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
		ellipse(width/4*1.4f, height/4, 20, 20);
		ellipse(width/4*2.6f, height/4, 20, 20);
		ellipse(width/4*1.4f, height/4*3, 20, 20);
		ellipse(width/4*2.6f, height/4*3, 20, 20);

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
