//Author: Carl & Lindevy

public class GameRunning {
	void update() {
		myTime.deltaTime();

		world.worldCreation();
		
		nexus.draw();

		for(int i = 0; i < playerBullets.length; i++) {
			if (playerBullets[i].isRendered) {
				playerBullets[i].update();
				playerBullets[i].draw();
				playerBullets[i].offScreenDeactivation(i);
				playerBullets[i].borderBounce(i);
				nexus.playerBulletCollision(i);
			}
		}

		for (int i = 0; i < enemyBullets.length; ++i) {
			if(enemyBullets[i].isRendered) {
				enemyBullets[i].update();
				enemyBullets[i].draw();
				nexus.enemyBulletCollision(i);
			}
		}

		for (int i = 0; i < enemies.length; ++i) {
			if (enemies[i].isRendered) {
				enemies[i].update(i);
				enemies[i].draw();
				nexus.enemyCollision(i);
			}
		}

		userInterface.update();
		userInterface.draw();

		player.update();
		player.draw();

		spawnManager.update();

		shields.update();
		shields.draw();
	}
}