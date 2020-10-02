//Author: Carl

Enemy[] enemies;
int enemySize = 20;
float enemySpeed = 50.0;
float enemySpawnCooldown = 2000; //1000 == 1 second

public class Enemy {
	PVector direction, position, velocity;
	int size;
	float bulletTime = enemyBulletTime;
	float bulletSpawnCooldown = enemyBulletSpawnCooldown;
	boolean isRendered = true;

	public Enemy(float x, float y, int spawnSide) {
		position = new PVector(x, y);

		//Checks which side to optimize pathing and avoid having the enemies clip through the walls
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

		size = enemySize;
	}


	void update(int i) {
		position.x += velocity.x * deltaTime;
		position.y += velocity.y * deltaTime;

		collision();
		shoot(i);
	}


	void draw() {
		//Main body
		fill(164, 55, 65);
		ellipseMode(CENTER);
		ellipse(position.x, position.y, size, size);

		//Body details
		strokeWeight(1);
		fill(215, 180, 70);
		rect(position.x - 8, position.y, 10, 5);
		rect(position.x + 8, position.y, 10, 5);
		rect(position.x, position.y - 8, 5, 10);
		rect(position.x, position.y + 8, 5, 10);
	}


	void collision() {
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


	void shoot(int i) {
		if(enemies[i].isRendered) {
			if (enemies[i].bulletTime < time) {
			enemies[i].bulletTime = time + enemies[i].bulletSpawnCooldown;

			EnemyBullet enemyBullet = new EnemyBullet(enemies[i].position.x, enemies[i].position.y);
			enemyBullets = (EnemyBullet[]) append(enemyBullets, enemyBullet);
			}
		}
	}
}