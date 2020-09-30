PlayerBullet[] playerBullets;
int playerBulletSize = 10;
float playerBulletSpawnCd = 500; //1000 == 1 second
float playerBulletTime = 500;
int bouncce = 0;

class PlayerBullet {
	PVector position, direction, mousePosition;
	int playerBulletVelocity = 1000;
	int size = playerBulletSize;
	boolean isRendered = true;
	boolean xBounce = true;
	boolean yBounce = true;


	PlayerBullet(float x, float y) {
		position = new PVector(x, y);
		direction = new PVector(0, 0);

		mousePosition = new PVector(0, 0);
		mousePosition.x = (mouseX);
		mousePosition.y = (mouseY);

		direction.x = ((mousePosition.x - position.x));	
		direction.y = ((mousePosition.y - position.y));
	}


	void update() {
		direction.normalize();
		position.add(direction.mult(playerBulletVelocity).mult(deltaTime));
		offScreenDeactivation();
		borderBounce();
		Collision();
	}


	void draw() {
		ellipseMode(CENTER);
		fill(255);
		ellipse(position.x, position.y, size, size);
	}


	void offScreenDeactivation() {
		for(int i = 0; i < playerBullets.length; i++) {
			if (playerBullets[i].position.x < 0 || playerBullets[i].position.x > width || playerBullets[i].position.y < 0 || playerBullets[i].position.y > height) {
				playerBullets[i].isRendered = false;
			}
		}
	}

	void borderBounce() {
		for (int i = 0; i < playerBullets.length; ++i) {
			if (playerBullets[i].position.x >= width/2 - size*2 && playerBullets[i].position.x <= width/2 + size*2 && playerBullets[i].xBounce == true) {
				playerBullets[i].direction.x *= -1;
				playerBullets[i].xBounce = false;
			}
			if (playerBullets[i].position.y >= height/2 - size*2 && playerBullets[i].position.y <= height/2 + size*2 && playerBullets[i].yBounce == true) {
				playerBullets[i].direction.y *= -1;
				playerBullets[i].yBounce = false;
			}
		}
	}

	void Collision() {
		for (int i = 0; i < playerBullets.length; ++i) {
			if (collision.playerBulletNexusCollision(playerBullets[i], nexus) && playerBullets[i].isRendered) {
				playerBullets[i].isRendered = false;
			}
		}
	}
}