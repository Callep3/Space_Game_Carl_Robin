//Classes
World world;
Nexus nexus;
Time myTime;
Player player;
SpawnManager spawnManager;
Collision collision;
Shields shields;


void setup() {
	world = new World();
	nexus = new Nexus();
	myTime = new Time();
	spawnManager = new SpawnManager();
	collision = new Collision();
	shields = new Shields();

	enemies = new Enemies[0];
	playerBullets = new PlayerBullet[0];
	enemyBullets = new EnemyBullet[0];
	player = new Player(width / 4, height / 4);

	size(1920, 1014);
	surface.setLocation(-0, 0);
	shields.setup();
}

void draw() {
	myTime.DeltaTime();

	if (nexusHealth <= 0) {
		//Nexus
		ellipseMode(CENTER);
		fill(0, 220, 0);
		ellipse(width/2, height/2, nexusSize, nexusSize);
		//NexusHealth
		fill(0);
		textAlign(CENTER);
		textSize(50);
		text(nexusHealth, width/2, height/2 + 15);
		//Game Over Text
		textAlign(CENTER);
		fill(200, 60, 60);
		textSize(200);
		text("Game Over", width/2, height/2 + 50);
		return;
	}

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

	player.update();
	player.draw();
	spawnManager.update();
	shields.update();
	shields.draw();
}