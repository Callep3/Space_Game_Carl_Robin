Enemy[] enemies;
int enemySize = 20;
float enemySpeed = 50.0;
float enemySpawnCd = 2000; //1000 == 1 second

public class Enemy {
	PVector direction, position, velocity;
	int r, g, b;
	int size;
	boolean isRendered = true;
	float bulletTime = enemyBulletTime;
	float bulletSpawnCd = enemyBulletSpawnCd;

	public Enemy(float x, float y, int spawnSide) {
		position = new PVector(x, y);

		if (spawnSide == 0 || spawnSide == 7) {
			direction = new PVector((width/2 - enemySize) - position.x, (height/2 - enemySize) - position.y).normalize();
		}
		if (spawnSide == 1 || spawnSide == 2) {
			direction = new PVector((width/2 + enemySize) - position.x, (height/2 - enemySize) - position.y).normalize();
		}
		if (spawnSide == 3 || spawnSide == 4) {
			direction = new PVector((width/2 + enemySize) - position.x, (height/2 + enemySize) - position.y).normalize();
		}
		if (spawnSide == 5 || spawnSide == 6) {
			direction = new PVector((width/2 - enemySize) - position.x, (height/2 + enemySize) - position.y).normalize();
		}

		velocity = new PVector(direction.x, direction.y);
		velocity.x = velocity.x * enemySpeed;
		velocity.y = velocity.y * enemySpeed;

		r = 164;
		g = 55;
		b = 65;
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
		fill(215, 180, 70);
		strokeWeight(1);
		rect(position.x - 8, position.y, 10, 5);
		rect(position.x + 8, position.y, 10, 5);
		rect(position.x, position.y - 8, 5, 10);
		rect(position.x, position.y + 8, 5, 10);
		//ellipse(position.x-8, position.y-4, 7, 7);
		//ellipse(position.x+8, position.y-4, 7, 7);

	}

	void Collision() {
		for (int i = 0; i < enemies.length; ++i) {
			for (int j = 0; j < playerBullets.length; ++j) {
				if (collision.playerBulletEnemyCollision(playerBullets[j], enemies[i]) && enemies[i].isRendered && playerBullets[j].isRendered) {
					enemies[i].isRendered = false;
					playerBullets[j].isRendered = false;
					score += 5;
				}
			}
		}
	}
}