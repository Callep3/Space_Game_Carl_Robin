//Classes
World world;
Nexus nexus;
Time myTime;
Player player;
SpawnManager spawnManager;
Collision collision;
Shields shields;
UserInterface userInterface;


void setup() {
	world = new World();
	nexus = new Nexus();
	myTime = new Time();
	spawnManager = new SpawnManager();
	collision = new Collision();
	shields = new Shields();
	userInterface = new UserInterface();

	enemies = new Enemies[0];
	playerBullets = new PlayerBullet[0];
	enemyBullets = new EnemyBullet[0];
	player = new Player(width / 4, height / 4);

	size(1920, 1014);
	surface.setLocation(-0, 0);
	shields.setup();
}

void draw() {
	if(startGame && nexusHealth > 0) {
		myTime.DeltaTime();

		world.worldCreation();

		for(int i = 0; i < playerBullets.length; i++) {
			if (playerBullets[i].isRendered) {
				playerBullets[i].update();
				playerBullets[i].draw();
			}
		}

		for (int i = 0; i < enemyBullets.length; ++i) {
			if(enemyBullets[i].isRendered) {
				enemyBullets[i].update();
				enemyBullets[i].draw();
				nexus.collision(i);
			}
		}

		for (int i = 0; i < enemies.length; ++i) {
			if (enemies[i].alive) {
				enemies[i].update();
				enemies[i].draw();
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
	if(!startGame) {
		userInterface.startMenu();
	}

	if (nexusHealth <= 0) {
			userInterface.gameOverScreen();
		}
	
}