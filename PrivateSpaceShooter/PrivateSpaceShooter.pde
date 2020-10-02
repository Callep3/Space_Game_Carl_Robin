//Classes
World world;
Nexus nexus;
Time myTime;
Player player;
SpawnManager spawnManager;
Collision collision;
Shields shields;
UserInterface userInterface;
PImage backgroundImage;
PImage nexusImage;


void setup() {
	backgroundImage = loadImage("background.PNG");
	nexusImage = loadImage("nexus.PNG");
	world = new World();
	nexus = new Nexus();
	myTime = new Time();
	spawnManager = new SpawnManager();
	collision = new Collision();
	shields = new Shields();
	userInterface = new UserInterface();

	enemies = new Enemy[0];
	playerBullets = new PlayerBullet[0];
	enemyBullets = new EnemyBullet[0];
	player = new Player(width / 4, height / 4);

	size(1920, 1014);
	surface.setLocation(-0, 0);
	shields.setup();
}

void draw() {
	if(startGame && nexusHealth > 0) {
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
				enemies[i].update();
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
	if(!startGame) {
		userInterface.startMenu();
	}

	if (nexusHealth <= 0) {
		userInterface.gameOverScreen();
	}
}