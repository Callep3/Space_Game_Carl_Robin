EnemyBullet[] enemyBullets;
int enemyBulletSize = 10;
float enemyBulletSpawnCd = 3000; //1000 == 1 second
float enemyBulletTime = 500;

class EnemyBullet {
	PVector position, direction;
	int enemyBulletVelocity = 500;
	int size = enemyBulletSize;
	boolean isRendered = true;
	


	EnemyBullet(float x, float y) {
		position = new PVector(x, y);
		direction = new PVector(width/2 - position.x, height/2 - position.y);

	}


	void update() {
		direction.normalize();
		offScreenDeactivation();

		position.add(direction.mult(enemyBulletVelocity).mult(deltaTime));
		

	}


	void draw() {
		ellipseMode(CENTER);
		fill(255, 0, 0);
		ellipse(position.x, position.y, enemyBulletSize, enemyBulletSize);
	}

	void offScreenDeactivation() {
		for(int i = 0; i < enemyBullets.length; i++) {
			if (enemyBullets[i].position.x < 0 || enemyBullets[i].position.x > width || enemyBullets[i].position.y < 0 || enemyBullets[i].position.y > height) {
				enemyBullets[i].isRendered = false;
			}
		}
	}


}