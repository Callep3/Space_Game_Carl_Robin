Enemies[] enemies;
int enemySize = 20;
float enemySpeed = 50.0;
float enemySpawnCd = 1000; //1000 == 1 second

public class Enemies {
	PVector direction, position, velocity;
	int r, g, b;
	int size;
	boolean alive = true;

	public Enemies(float x, float y) {
		position = new PVector(x, y);

		direction = new PVector(width/2 - position.x, height/2 - position.y).normalize();

		velocity = new PVector(direction.x, direction.y);
		velocity.x = velocity.x * enemySpeed;
		velocity.y = velocity.y * enemySpeed;

		r = 255;
		g = 0;
		b = 0;

		size = enemySize;
	}

	void update() {
		position.x += velocity.x * deltaTime;
		position.y += velocity.y * deltaTime;
		Collision();
	}

	void draw() {
		ellipseMode(CENTER);
		fill(r, g, b);
		ellipse(position.x, position.y, size, size);
	}

	void Collision() {
		for (int i = 0; i < enemies.length; ++i) {
			if (collision.roundCollision(enemies[i], nexus) && enemies[i].alive) {
				enemies[i].alive = false;
				nexusHealth -= 1;
			}
		}
	}
}