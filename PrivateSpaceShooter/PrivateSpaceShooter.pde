//Classes
World world;
Nexus nexus;
Time myTime;
Player player;
SpawnManager spawnManager;
Collision collision;


void setup() {
	size(1920, 1014);
	surface.setLocation(-1923, 4);

	world = new World();
	nexus = new Nexus();
	myTime = new Time();
	spawnManager = new SpawnManager();
	collision = new Collision();

	enemies = new Enemies[0];
	bullets = new Bullet[0];
	player = new Player(width / 4, height / 4);
}

void draw() {
	myTime.DeltaTime();

	if (nexusHealth <= 0) {
		textAlign(CENTER);
		fill(200, 60, 60);
		textSize(200);
		text("Game Over", width/2, height/2 + 50);
		nexusHealth = 0;
		return;
	}

	world.worldCreation();

	for(int i = 0; i < bullets.length; i++) {
		if (bullets[i].isRendered) {
			bullets[i].update();
			bullets[i].draw();
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
}