int topLftShield, topRgtShield, btmLftShield, btmRgtShield;
int shieldMaxHealth = 50;

public class Shields {
	float lftShieldPoint = width/2-150;
	float rgtShieldPoint = width/2+150;
	float topShieldPoint = height/2-150;
	float btmShieldPoint = height/2+150;
	float middleShieldPointHeight = height/2;
	float middleShieldPointWidth = width/2;
	int numberOfShields = 4;

	void setup() {
		topLftShield = shieldMaxHealth;
		topRgtShield = shieldMaxHealth;
		btmLftShield = shieldMaxHealth;
		btmRgtShield = shieldMaxHealth;
	}

	void update() {
		
		for (int n = 0; n < numberOfShields; ++n) {
			switch (n) {
				case 0:
					if (topLftShield > 0) {
						for (int i = 0; i < enemies.length; ++i) {
							if (collision.enemyShieldsCollision(enemies[i], lftShieldPoint, middleShieldPointHeight, middleShieldPointWidth, topShieldPoint) && enemies[i].alive) {
								enemies[i].alive = false;
								topLftShield -= 1;
							}
						}
						for (int i = 0; i < enemyBullets.length; ++i) {
							if (collision.enemyBulletShieldsCollision(enemyBullets[i], lftShieldPoint, middleShieldPointHeight, middleShieldPointWidth, topShieldPoint) && enemyBullets[i].isRendered) {
								enemyBullets[i].isRendered = false;
								topLftShield -= 1;
							}
						}
						for (int i = 0; i < playerBullets.length; ++i) {
							if (collision.playerBulletShieldsCollision(playerBullets[i], lftShieldPoint, middleShieldPointHeight, middleShieldPointWidth, topShieldPoint) && playerBullets[i].isRendered) {
								if (topLftShield < shieldMaxHealth) {
									topLftShield += 1;
								}
								if (playerBullets[i].xBounce == true && playerBullets[i].yBounce == true) {
									PVector base1 = new PVector(lftShieldPoint, middleShieldPointHeight);
									PVector base2 = new PVector(middleShieldPointWidth, topShieldPoint);
									PVector baseDelta = PVector.sub(base2, base1);
									baseDelta.normalize();
									PVector normal = new PVector(-baseDelta.y, baseDelta.x);

									PVector incidence = PVector.mult(playerBullets[i].velocity, -1);
									incidence.normalize();

									float dot = incidence.dot(normal);

									playerBullets[i].velocity.set(2*normal.x*dot - incidence.x, 2*normal.y*dot - incidence.y, 0);
									playerBullets[i].velocity.mult(playerBullets[i].playerBulletVelocity).mult(deltaTime);

									playerBullets[i].xBounce = false;
									playerBullets[i].yBounce = false;
								}
							}
						}
					}
					break;
				case 1:
					if (topRgtShield > 0) {
						for (int i = 0; i < enemies.length; ++i) {
							if (collision.enemyShieldsCollision(enemies[i], middleShieldPointWidth, topShieldPoint, rgtShieldPoint, middleShieldPointHeight) && enemies[i].alive) {
								enemies[i].alive = false;
								topRgtShield -= 1;
							}
						}
						for (int i = 0; i < enemyBullets.length; ++i) {
							if (collision.enemyBulletShieldsCollision(enemyBullets[i], middleShieldPointWidth, topShieldPoint, rgtShieldPoint, middleShieldPointHeight) && enemyBullets[i].isRendered) {
								enemyBullets[i].isRendered = false;
								topRgtShield -= 1;
							}
						}
						for (int i = 0; i < playerBullets.length; ++i) {
							if (collision.playerBulletShieldsCollision(playerBullets[i], middleShieldPointWidth, topShieldPoint, rgtShieldPoint, middleShieldPointHeight) && playerBullets[i].isRendered) {
								if (topRgtShield < shieldMaxHealth) {
									topRgtShield += 1;
								}
								if (playerBullets[i].xBounce == true && playerBullets[i].yBounce == true) {
									PVector base1 = new PVector(middleShieldPointWidth, topShieldPoint);
									PVector base2 = new PVector(rgtShieldPoint, middleShieldPointHeight);
									PVector baseDelta = PVector.sub(base2, base1);
									baseDelta.normalize();
									PVector normal = new PVector(-baseDelta.y, baseDelta.x);

									PVector incidence = PVector.mult(playerBullets[i].velocity, -1);
									incidence.normalize();

									float dot = incidence.dot(normal);

									playerBullets[i].velocity.set(2*normal.x*dot - incidence.x, 2*normal.y*dot - incidence.y, 0);
									playerBullets[i].velocity.mult(playerBullets[i].playerBulletVelocity).mult(deltaTime);

									playerBullets[i].xBounce = false;
									playerBullets[i].yBounce = false;
								}
							}
						}
					}
					break;
				case 2:
					if (btmLftShield > 0) {
						for (int i = 0; i < enemies.length; ++i) {
							if (collision.enemyShieldsCollision(enemies[i], middleShieldPointWidth, btmShieldPoint, lftShieldPoint, middleShieldPointHeight) && enemies[i].alive) {
								enemies[i].alive = false;
								btmLftShield -= 1;
							}
						}
						for (int i = 0; i < enemyBullets.length; ++i) {
							if (collision.enemyBulletShieldsCollision(enemyBullets[i], middleShieldPointWidth, btmShieldPoint, lftShieldPoint, middleShieldPointHeight) && enemyBullets[i].isRendered) {
								enemyBullets[i].isRendered = false;
								btmLftShield -= 1;
							}
						}
						for (int i = 0; i < playerBullets.length; ++i) {
							if (collision.playerBulletShieldsCollision(playerBullets[i], middleShieldPointWidth, btmShieldPoint, lftShieldPoint, middleShieldPointHeight) && playerBullets[i].isRendered) {
								if (btmLftShield < shieldMaxHealth) {
									btmLftShield += 1;
								}
								if (playerBullets[i].xBounce == true && playerBullets[i].yBounce == true) {
									PVector base1 = new PVector(middleShieldPointWidth, btmShieldPoint);
									PVector base2 = new PVector(lftShieldPoint, middleShieldPointHeight);
									PVector baseDelta = PVector.sub(base2, base1);
									baseDelta.normalize();
									PVector normal = new PVector(-baseDelta.y, baseDelta.x);

									PVector incidence = PVector.mult(playerBullets[i].velocity, -1);
									incidence.normalize();

									float dot = incidence.dot(normal);

									playerBullets[i].velocity.set(2*normal.x*dot - incidence.x, 2*normal.y*dot - incidence.y, 0);
									playerBullets[i].velocity.mult(playerBullets[i].playerBulletVelocity).mult(deltaTime);

									playerBullets[i].xBounce = false;
									playerBullets[i].yBounce = false;
								}
							}
						}
					}
					break;
				case 3:
					if (btmRgtShield > 0) {
						for (int i = 0; i < enemies.length; ++i) {
							if (collision.enemyShieldsCollision(enemies[i], rgtShieldPoint, middleShieldPointHeight, middleShieldPointWidth, btmShieldPoint) && enemies[i].alive) {
								enemies[i].alive = false;
								btmRgtShield -= 1;
							}
						}
						for (int i = 0; i < enemyBullets.length; ++i) {
							if (collision.enemyBulletShieldsCollision(enemyBullets[i], rgtShieldPoint, middleShieldPointHeight, middleShieldPointWidth, btmShieldPoint) && enemyBullets[i].isRendered) {
								enemyBullets[i].isRendered = false;
								btmRgtShield -= 1;
							}
						}
						for (int i = 0; i < playerBullets.length; ++i) {
							if (collision.playerBulletShieldsCollision(playerBullets[i], rgtShieldPoint, middleShieldPointHeight, middleShieldPointWidth, btmShieldPoint) && playerBullets[i].isRendered) {
								if (btmRgtShield < shieldMaxHealth) {
									btmRgtShield += 1;
								}
								if (playerBullets[i].xBounce == true && playerBullets[i].yBounce == true) {
									PVector base1 = new PVector(rgtShieldPoint, middleShieldPointHeight);
									PVector base2 = new PVector(middleShieldPointWidth, btmShieldPoint);
									PVector baseDelta = PVector.sub(base2, base1);
									baseDelta.normalize();
									PVector normal = new PVector(-baseDelta.y, baseDelta.x);

									PVector incidence = PVector.mult(playerBullets[i].velocity, -1);
									incidence.normalize();

									float dot = incidence.dot(normal);

									playerBullets[i].velocity.set(2*normal.x*dot - incidence.x, 2*normal.y*dot - incidence.y, 0);
									playerBullets[i].velocity.mult(playerBullets[i].playerBulletVelocity).mult(deltaTime);

									playerBullets[i].xBounce = false;
									playerBullets[i].yBounce = false;
								}
							}
						}
					}
					break;
			}
		}
	}
	

	void draw() {
		//Shields
		stroke(20, 230, 151);
		fill(20, 230, 151);
		textSize(25);
		textAlign(CENTER);
		if (topLftShield > 0) {
			line(lftShieldPoint, middleShieldPointHeight, middleShieldPointWidth, topShieldPoint);
			text(topLftShield, width/2-95, height/2-85);
		}
		if (topRgtShield > 0) {
			line(middleShieldPointWidth, topShieldPoint, rgtShieldPoint, middleShieldPointHeight);
			text(topRgtShield, width/2+95, height/2-85);
		}
		if (btmLftShield > 0) {
			line(middleShieldPointWidth, btmShieldPoint, lftShieldPoint, middleShieldPointHeight);
			text(btmLftShield, width/2-95, height/2+95);
		}
		if (btmRgtShield > 0) {
			line(rgtShieldPoint, middleShieldPointHeight, middleShieldPointWidth, btmShieldPoint);
			text(btmRgtShield, width/2+95, height/2+95);
		}
		
		//Reset stroke color
		stroke(0);
	}
}