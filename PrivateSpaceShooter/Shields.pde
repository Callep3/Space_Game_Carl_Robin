int topLftShield, topRgtShield, btmLftShield, btmRgtShield;
int shieldMaxHealth = 30;

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
		for (int i = 0; i < enemies.length; ++i) {
			for (int n = 0; n < numberOfShields; ++n) {
				switch (n) {
					case 0:
						if (topLftShield > 0) {
							if (collision.enemyShieldsCollision(enemies[i], lftShieldPoint, middleShieldPointHeight, middleShieldPointWidth, topShieldPoint) && enemies[i].alive) {
								enemies[i].alive = false;
								topLftShield -= 1;
							}
						}
						break;
					case 1:
						if (topRgtShield > 0) {
							if (collision.enemyShieldsCollision(enemies[i], middleShieldPointWidth, topShieldPoint, rgtShieldPoint, middleShieldPointHeight) && enemies[i].alive) {
								enemies[i].alive = false;
								topRgtShield -= 1;
							}
						}
						break;
					case 2:
						if (btmLftShield > 0) {
							if (collision.enemyShieldsCollision(enemies[i], middleShieldPointWidth, btmShieldPoint, lftShieldPoint, middleShieldPointHeight) && enemies[i].alive) {
								enemies[i].alive = false;
								btmLftShield -= 1;
							}
						}
						break;
					case 3:
						if (btmRgtShield > 0) {
							if (collision.enemyShieldsCollision(enemies[i], rgtShieldPoint, middleShieldPointHeight, middleShieldPointWidth, btmShieldPoint) && enemies[i].alive) {
								enemies[i].alive = false;
								btmRgtShield -= 1;
							}
						}
						break;
				}
			}
		}
		for (int i = 0; i < enemyBullets.length; ++i) {
			for (int n = 0; n < numberOfShields; ++n) {
				switch (n) {
					case 0:
						if (topLftShield > 0) {
							if (collision.enemyBulletShieldsCollision(enemyBullets[i], lftShieldPoint, middleShieldPointHeight, middleShieldPointWidth, topShieldPoint) && enemyBullets[i].isRendered) {
								enemyBullets[i].isRendered = false;
								topLftShield -= 1;
							}
						}
						break;
					case 1:
						if (topRgtShield > 0) {
							if (collision.enemyBulletShieldsCollision(enemyBullets[i], middleShieldPointWidth, topShieldPoint, rgtShieldPoint, middleShieldPointHeight) && enemyBullets[i].isRendered) {
								enemyBullets[i].isRendered = false;
								topRgtShield -= 1;
							}
						}
						break;
					case 2:
						if (btmLftShield > 0) {
							if (collision.enemyBulletShieldsCollision(enemyBullets[i], middleShieldPointWidth, btmShieldPoint, lftShieldPoint, middleShieldPointHeight) && enemyBullets[i].isRendered) {
								enemyBullets[i].isRendered = false;
								btmLftShield -= 1;
							}
						}
						break;
					case 3:
						if (btmRgtShield > 0) {
							if (collision.enemyBulletShieldsCollision(enemyBullets[i], rgtShieldPoint, middleShieldPointHeight, middleShieldPointWidth, btmShieldPoint) && enemyBullets[i].isRendered) {
								enemyBullets[i].isRendered = false;
								btmRgtShield -= 1;
							}
						}
						break;
				}
			}
		}
	}

	void draw() {
		//Shields
		stroke(60, 200, 20);
		fill(60, 200, 20);
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