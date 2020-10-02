//Author: Carl & Lindevy

int nexusSize = 150;
int nexusHealth = 20;

class Nexus {
	PVector position = new PVector(width/2, height/2);
	int size = nexusSize;


	void draw() {
		//Nexus
		image(nexusImage, width/2 - 75, height/2 - 75);

		//NexusHealth
		fill(210, 255, 210);
		textAlign(CENTER);
		textSize(50);
		text(nexusHealth, width/2, height/2 + 15);
	}


	void playerBulletCollision(int i) {
		if (collision.playerBulletNexusCollision(playerBullets[i], nexus)) {
			playerBullets[i].isRendered = false;
		}
	}


	void enemyBulletCollision(int i) {
		if (collision.enemyBulletNexusCollision(enemyBullets[i], nexus)) {
			enemyBullets[i].isRendered = false;
			nexusHealth -= 1;
		}
	}


	void enemyCollision(int i) {
		if (collision.enemyNexusCollision(enemies[i], nexus)) {
			enemies[i].isRendered = false;
			nexusHealth -= 1;
		}
	}	
}
  
