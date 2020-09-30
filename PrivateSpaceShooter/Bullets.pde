Bullet[] bullets;
int bulletSize = 10;
float bulletSpawnCd = 2000; //1000 == 1 second
float bulletSpeed = 150;


class Bullet {
	PVector position, direction, mousePosition;
	int bulletVelocity = 600;
	int size = bulletSize;
	boolean insidePlayArea = true;


	Bullet(float x, float y) {
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
		position.add(direction.mult(bulletVelocity).mult(deltaTime));
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
		for(int i = 0; i < bullets.length; i++) {
			if (bullets[i].position.x < 0 || bullets[i].position.x > width || bullets[i].position.y < 0 || bullets[i].position.y > height) {
				bullets[i].insidePlayArea = false;
			}
		}
	}

	void borderBounce() {
		for (int i = 0; i < bullets.length; ++i) {
			if (bullets[i].position.x >= width/2 - size*2 && bullets[i].position.x <= width/2 + size*2) {
				bullets[i].direction.x *= -1;
			}
			if (bullets[i].position.y >= height/2 - size*2 && bullets[i].position.y <= height/2 + size*2) {
				bullets[i].direction.y *= -1;
			}
		}
	}

	void Collision() {
		for (int i = 0; i < bullets.length; ++i) {
			if (collision.bulletNexusCollision(bullets[i], nexus) && bullets[i].insidePlayArea) {
				bullets[i].insidePlayArea = false;
			}
		}
	}
}