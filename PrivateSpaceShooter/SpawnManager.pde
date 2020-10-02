//Author: Carl

public class SpawnManager {
	//1000 == 1 second before something spawns when the game starts
	float spawnTime = 2000;
	

	void update() {
		if (spawnTime < time) {
			spawnTime = time + enemySpawnCooldown;
			if (enemySpawnCooldown > 750) {
				enemySpawnCooldown -= 5;
			}

			int spawnSide = int(random(0, 8));

			PVector spawnLocation;
			spawnLocation = new PVector(0, -enemySize);

			switch (spawnSide) {
				case 0: //top left
					spawnLocation = new PVector(random(-enemySize, width/2 - enemySize), -enemySize);
					break;	
				case 1: //top right
					spawnLocation = new PVector(random(width/2 + enemySize, width + enemySize), -enemySize);
					break;	
				case 2: //right top
					spawnLocation = new PVector(width + enemySize, random(-enemySize, height/2 - enemySize));
					break;	
				case 3: //right bottom
					spawnLocation = new PVector(width + enemySize, random(height/2 + enemySize, height + enemySize));
					break;	
				case 4: //bottom right
					spawnLocation = new PVector(random(width/2 + enemySize, width + enemySize), height + enemySize);
					break;	
				case 5: //bottom left
					spawnLocation = new PVector(random(-enemySize, width/2 - enemySize), height + enemySize);
					break;	
				case 6: //left bottom
					spawnLocation = new PVector(-enemySize, random(height/2 + enemySize, height + enemySize));
					break;	
				case 7: //left top
					spawnLocation = new PVector(-enemySize, random(-enemySize, height/2 - enemySize));
					break;
			}

			Enemy enemySpawn = new Enemy(spawnLocation.x, spawnLocation.y, spawnSide);
			enemies = (Enemy[]) append(enemies, enemySpawn);
		}

		//PlayerBullets
		if (playerBulletTime < time && mouseHeld) {
			playerBulletTime = time + playerBulletSpawnCooldown;

			PlayerBullet bulletSpawn = new PlayerBullet(player.position.x, player.position.y);
			playerBullets = (PlayerBullet[]) append(playerBullets, bulletSpawn);
		}
	}
}