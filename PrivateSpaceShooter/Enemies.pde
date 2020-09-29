public class Enemies {
	PVector direction, position, velocity;
	int r, g, b;

	public Enemies(float x, float y) {
		position = new PVector(x, y);

		direction = new PVector(width/2 - position.x, height/2 - position.y).normalize();

		velocity = new PVector(direction.x, direction.y);
		velocity.x = velocity.x * enemySpeed;
		velocity.y = velocity.y * enemySpeed;

		r = 255;
		g = 0;
		b = 0;
	}

	void update() {
		position.x += velocity.x * deltaTime;
		position.y += velocity.y * deltaTime;
	}

	void draw() {
		ellipseMode(CENTER);
		fill(r, g, b);
		ellipse(position.x, position.y, enemySize, enemySize);
	}
}