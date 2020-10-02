//Author: Lindevy

EnemyBullet[] enemyBullets;
int enemyBulletSize = 10;

float enemyBulletSpawnCooldown = 3000; //1000 == 1 second
float enemyBulletTime = 500;

class EnemyBullet {
	PVector position, direction, velocity;
	int enemyBulletVelocity = 350;
	int size = enemyBulletSize;
	boolean isRendered = true;
	

	EnemyBullet(float x, float y) {
		position = new PVector(x, y);
		direction = new PVector(width/2 - position.x, height/2 - position.y);
		velocity = new PVector(0, 0);
	}


	void update() {
		direction.normalize();
		velocity = direction.mult(enemyBulletVelocity).mult(deltaTime);

		position.add(velocity);
	}


	void draw() {
		fill(164, 44, 65);
		ellipseMode(CENTER);
		ellipse(position.x, position.y, enemyBulletSize, enemyBulletSize);
	}
}