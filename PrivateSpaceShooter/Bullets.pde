class Bullet {
PVector position, direction, mousePosition;
int bulletVelocity = 600;

	Bullet(float x, float y) {
		position = new PVector(x, y);
		direction = new PVector(0, 0);
		mousePosition = new PVector(0, 0);
		mousePosition.x = (mouseX);
		mousePosition.y = (mouseY);
	}

	void update() {

		direction.x = ((mousePosition.x - position.x) * 4);
		direction.y = ((mousePosition.y - position.y) * 4);
		direction.normalize();

		position.add(direction.mult(bulletVelocity).mult(deltaTime));
	}


	void draw() {
		ellipseMode(CENTER);
		fill(255);
		ellipse(position.x, position.y, bulletSize, bulletSize);
	}

}