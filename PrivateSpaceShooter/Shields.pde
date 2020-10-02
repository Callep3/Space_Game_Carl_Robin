//Author: Carl

int topLeftShieldHp, topRightShieldHp, bottomLeftShieldHp, bottomRightShieldHp;
int shieldMaxHealth = 50;

public class Shields {
	float leftShieldPoint = width/2-150;
	float rightShieldPoint = width/2+150;
	float topShieldPoint = height/2-150;
	float bottomShieldPoint = height/2+150;
	float middleShieldPointHeight = height/2;
	float middleShieldPointWidth = width/2;
	int numberOfShields = 4;


	void setup() {
		topLeftShieldHp = shieldMaxHealth;
		topRightShieldHp = shieldMaxHealth;
		bottomLeftShieldHp = shieldMaxHealth;
		bottomRightShieldHp = shieldMaxHealth;
	}


	void update() {
		topLeftShield();
		topRightShield();
		bottomLeftShield();
		bottomRightShield();
	}
	

	void draw() {
		//Shields
		stroke(20, 230, 151);
		fill(20, 230, 151);
		textSize(25);
		textAlign(CENTER);
		if (topLeftShieldHp > 0) {
			line(leftShieldPoint, middleShieldPointHeight, middleShieldPointWidth, topShieldPoint);
			text(topLeftShieldHp, width/2-95, height/2-85);
		}
		if (topRightShieldHp > 0) {
			line(middleShieldPointWidth, topShieldPoint, rightShieldPoint, middleShieldPointHeight);
			text(topRightShieldHp, width/2+95, height/2-85);
		}
		if (bottomLeftShieldHp > 0) {
			line(middleShieldPointWidth, bottomShieldPoint, leftShieldPoint, middleShieldPointHeight);
			text(bottomLeftShieldHp, width/2-95, height/2+95);
		}
		if (bottomRightShieldHp > 0) {
			line(rightShieldPoint, middleShieldPointHeight, middleShieldPointWidth, bottomShieldPoint);
			text(bottomRightShieldHp, width/2+95, height/2+95);
		}
		
		//Reset stroke color
		stroke(0);
	}


	void topLeftShield() {
		if (topLeftShieldHp > 0) {
			for (int i = 0; i < enemies.length; ++i) {
				if (collision.enemyShieldsCollision(enemies[i], leftShieldPoint, middleShieldPointHeight, middleShieldPointWidth, topShieldPoint) && enemies[i].isRendered) {
					enemies[i].isRendered = false;
					topLeftShieldHp -= 1;
				}
			}
			for (int i = 0; i < enemyBullets.length; ++i) {
				if (collision.enemyBulletShieldsCollision(enemyBullets[i], leftShieldPoint, middleShieldPointHeight, middleShieldPointWidth, topShieldPoint) && enemyBullets[i].isRendered) {
					enemyBullets[i].isRendered = false;
					topLeftShieldHp -= 1;
				}
			}
			for (int i = 0; i < playerBullets.length; ++i) {
				if (collision.playerBulletShieldsCollision(playerBullets[i], leftShieldPoint, middleShieldPointHeight, middleShieldPointWidth, topShieldPoint) && playerBullets[i].isRendered) {
					if (topLeftShieldHp < shieldMaxHealth) {
						topLeftShieldHp += 1;
					}
					if (playerBullets[i].xBounce == true && playerBullets[i].yBounce == true) {
						//Calculation to determine the angle of which the ball should bounce of the shield (Did not do this myself (Thank god for google))
						PVector base1 = new PVector(leftShieldPoint, middleShieldPointHeight);
						PVector base2 = new PVector(middleShieldPointWidth, topShieldPoint);
						PVector baseDelta = PVector.sub(base2, base1);
						baseDelta.normalize();

						PVector normal = new PVector(-baseDelta.y, baseDelta.x);

						PVector incidence = PVector.mult(playerBullets[i].velocity, -1);
						incidence.normalize();

						float dot = incidence.dot(normal);

						playerBullets[i].velocity.set(2*normal.x*dot - incidence.x, 2*normal.y*dot - incidence.y, 0);
						playerBullets[i].velocity.mult(playerBullets[i].playerBulletSpeed).mult(deltaTime);

						playerBullets[i].xBounce = false;
						playerBullets[i].yBounce = false;
					}
				}
			}
		}
	}


	void topRightShield() {
		if (topRightShieldHp > 0) {
			for (int i = 0; i < enemies.length; ++i) {
				if (collision.enemyShieldsCollision(enemies[i], middleShieldPointWidth, topShieldPoint, rightShieldPoint, middleShieldPointHeight) && enemies[i].isRendered) {
					enemies[i].isRendered = false;
					topRightShieldHp -= 1;
				}
			}
			for (int i = 0; i < enemyBullets.length; ++i) {
				if (collision.enemyBulletShieldsCollision(enemyBullets[i], middleShieldPointWidth, topShieldPoint, rightShieldPoint, middleShieldPointHeight) && enemyBullets[i].isRendered) {
					enemyBullets[i].isRendered = false;
					topRightShieldHp -= 1;
				}
			}
			for (int i = 0; i < playerBullets.length; ++i) {
				if (collision.playerBulletShieldsCollision(playerBullets[i], middleShieldPointWidth, topShieldPoint, rightShieldPoint, middleShieldPointHeight) && playerBullets[i].isRendered) {
					if (topRightShieldHp < shieldMaxHealth) {
						topRightShieldHp += 1;
					}
					if (playerBullets[i].xBounce == true && playerBullets[i].yBounce == true) {
						//Calculation to determine the angle of which the ball should bounce of the shield (Did not do this myself (Thank god for google))
						PVector base1 = new PVector(middleShieldPointWidth, topShieldPoint);
						PVector base2 = new PVector(rightShieldPoint, middleShieldPointHeight);
						PVector baseDelta = PVector.sub(base2, base1);
						baseDelta.normalize();
						PVector normal = new PVector(-baseDelta.y, baseDelta.x);

						PVector incidence = PVector.mult(playerBullets[i].velocity, -1);
						incidence.normalize();

						float dot = incidence.dot(normal);

						playerBullets[i].velocity.set(2*normal.x*dot - incidence.x, 2*normal.y*dot - incidence.y, 0);
						playerBullets[i].velocity.mult(playerBullets[i].playerBulletSpeed).mult(deltaTime);

						playerBullets[i].xBounce = false;
						playerBullets[i].yBounce = false;
					}
				}
			}
		}
	}


	void bottomLeftShield() {
		if (bottomLeftShieldHp > 0) {
			for (int i = 0; i < enemies.length; ++i) {
				if (collision.enemyShieldsCollision(enemies[i], middleShieldPointWidth, bottomShieldPoint, leftShieldPoint, middleShieldPointHeight) && enemies[i].isRendered) {
					enemies[i].isRendered = false;
					bottomLeftShieldHp -= 1;
				}
			}
			for (int i = 0; i < enemyBullets.length; ++i) {
				if (collision.enemyBulletShieldsCollision(enemyBullets[i], middleShieldPointWidth, bottomShieldPoint, leftShieldPoint, middleShieldPointHeight) && enemyBullets[i].isRendered) {
					enemyBullets[i].isRendered = false;
					bottomLeftShieldHp -= 1;
				}
			}
			for (int i = 0; i < playerBullets.length; ++i) {
				if (collision.playerBulletShieldsCollision(playerBullets[i], middleShieldPointWidth, bottomShieldPoint, leftShieldPoint, middleShieldPointHeight) && playerBullets[i].isRendered) {
					if (bottomLeftShieldHp < shieldMaxHealth) {
						bottomLeftShieldHp += 1;
					}
					if (playerBullets[i].xBounce == true && playerBullets[i].yBounce == true) {
						//Calculation to determine the angle of which the ball should bounce of the shield (Did not do this myself (Thank god for google))
						PVector base1 = new PVector(middleShieldPointWidth, bottomShieldPoint);
						PVector base2 = new PVector(leftShieldPoint, middleShieldPointHeight);
						PVector baseDelta = PVector.sub(base2, base1);
						baseDelta.normalize();
						PVector normal = new PVector(-baseDelta.y, baseDelta.x);

						PVector incidence = PVector.mult(playerBullets[i].velocity, -1);
						incidence.normalize();

						float dot = incidence.dot(normal);

						playerBullets[i].velocity.set(2*normal.x*dot - incidence.x, 2*normal.y*dot - incidence.y, 0);
						playerBullets[i].velocity.mult(playerBullets[i].playerBulletSpeed).mult(deltaTime);

						playerBullets[i].xBounce = false;
						playerBullets[i].yBounce = false;
					}
				}
			}
		}
	}


	void bottomRightShield() {
		if (bottomRightShieldHp > 0) {
			for (int i = 0; i < enemies.length; ++i) {
				if (collision.enemyShieldsCollision(enemies[i], rightShieldPoint, middleShieldPointHeight, middleShieldPointWidth, bottomShieldPoint) && enemies[i].isRendered) {
					enemies[i].isRendered = false;
					bottomRightShieldHp -= 1;
				}
			}
			for (int i = 0; i < enemyBullets.length; ++i) {
				if (collision.enemyBulletShieldsCollision(enemyBullets[i], rightShieldPoint, middleShieldPointHeight, middleShieldPointWidth, bottomShieldPoint) && enemyBullets[i].isRendered) {
					enemyBullets[i].isRendered = false;
					bottomRightShieldHp -= 1;
				}
			}
			for (int i = 0; i < playerBullets.length; ++i) {
				if (collision.playerBulletShieldsCollision(playerBullets[i], rightShieldPoint, middleShieldPointHeight, middleShieldPointWidth, bottomShieldPoint) && playerBullets[i].isRendered) {
					if (bottomRightShieldHp < shieldMaxHealth) {
						bottomRightShieldHp += 1;
					}
					if (playerBullets[i].xBounce == true && playerBullets[i].yBounce == true) {
						//Calculation to determine the angle of which the ball should bounce of the shield (Did not do this myself (Thank god for google))
						PVector base1 = new PVector(rightShieldPoint, middleShieldPointHeight);
						PVector base2 = new PVector(middleShieldPointWidth, bottomShieldPoint);
						PVector baseDelta = PVector.sub(base2, base1);
						baseDelta.normalize();
						PVector normal = new PVector(-baseDelta.y, baseDelta.x);

						PVector incidence = PVector.mult(playerBullets[i].velocity, -1);
						incidence.normalize();

						float dot = incidence.dot(normal);

						playerBullets[i].velocity.set(2*normal.x*dot - incidence.x, 2*normal.y*dot - incidence.y, 0);
						playerBullets[i].velocity.mult(playerBullets[i].playerBulletSpeed).mult(deltaTime);

						playerBullets[i].xBounce = false;
						playerBullets[i].yBounce = false;
					}
				}
			}
		}
	}
}
