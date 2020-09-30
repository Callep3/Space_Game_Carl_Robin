public class SpawnManager {
	//1000 == 1 second before something spawns when the game starts
	float spawnTime = 2000;
	

	void update() {
		if (spawnTime < time) {
			spawnTime = time + enemySpawnCd;
			if (enemySpawnCd > 500) {
				enemySpawnCd -= 5;
			}

			int spawnSide = int(random(0, 4));
			PVector spawnLocation;
			spawnLocation = new PVector(random(30, width - 30), -enemySize);
			switch (spawnSide) {
				case 0: //top
					spawnLocation = new PVector(random(30, width - 30), -enemySize);
					break;	
				case 1: //bottom
					spawnLocation = new PVector(random(30, width - 30), height + enemySize);
					break;	
				case 2: //left
					spawnLocation = new PVector(-enemySize, random(30, height - 30));
					break;	
				case 3: //right
					spawnLocation = new PVector(width + enemySize, random(30, height - 30));
					break;	
			}

			Enemies enemySpawn = new Enemies(spawnLocation.x, spawnLocation.y);
			enemies = (Enemies[]) append(enemies, enemySpawn);
		}
		if(playerBulletTime < time && mouseHeld) {
			playerBulletTime = time + playerBulletSpawnCd;

			PlayerBullet bulletSpawn = new PlayerBullet(player.position.x, player.position.y);
			playerBullets = (PlayerBullet[]) append(playerBullets, bulletSpawn);
		}
	}
}