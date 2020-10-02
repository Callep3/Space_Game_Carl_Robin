PlayerBullet[] playerBullets;
int playerBulletSize = 10;

float playerBulletSpawnCd = 350; //1000 == 1 second
float playerBulletTime = 500;

class PlayerBullet {
	PVector position, direction, velocity, mousePosition;
	int playerBulletSpeed = 500;
	int size = playerBulletSize;
	boolean isRendered = true;
	boolean xBounce = true;
	boolean yBounce = true;


	PlayerBullet(float x, float y) {
		position = new PVector(x, y);
		direction = new PVector(0, 0);
		velocity = new PVector(0, 0);

		mousePosition = new PVector(0, 0);
		mousePosition.x = (mouseX);
		mousePosition.y = (mouseY);

		direction.x = ((mousePosition.x - position.x));	
		direction.y = ((mousePosition.y - position.y));
		direction.normalize();

		velocity = direction.mult(playerBulletSpeed).mult(deltaTime);
	}


	void update() {
		position.add(velocity);
	}


	void draw() {
		fill(20, 230, 151);
		ellipseMode(CENTER);
		ellipse(position.x, position.y, size, size);
	}


	void offScreenDeactivation(int i) {
		if (playerBullets[i].position.x < 0 || playerBullets[i].position.x > width) {
			playerBullets[i].isRendered = false;
		}
		if (playerBullets[i].position.y < 0 || playerBullets[i].position.y > height) {
			playerBullets[i].isRendered = false;
		}
	}


	void borderBounce(int i) {
		if (playerBullets[i].position.x >= width/2 - size && playerBullets[i].position.x <= width/2 + size && playerBullets[i].xBounce == true) {
			playerBullets[i].direction.x *= -1;
			playerBullets[i].xBounce = false;
		}
		if (playerBullets[i].position.y >= height/2 - size && playerBullets[i].position.y <= height/2 + size && playerBullets[i].yBounce == true) {
			playerBullets[i].direction.y *= -1;
			playerBullets[i].yBounce = false;
		}
	}
}