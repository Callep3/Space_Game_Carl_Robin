//Classes
World world;
Nexus nexus;
Time myTime;
Player player;
SpawnManager spawnManager;
Collision collision;


void setup() {
	world = new World();
	nexus = new Nexus();
	size(1920, 1014);
	background(0);
	surface.setLocation(-1923, 4);
	enemies = new Enemies[0];
	player = new Player(width / 4, height / 4);
	myTime = new Time();
	spawnManager = new SpawnManager();
	collision = new Collision();
}

void draw() {
	myTime.DeltaTime();
	world.worldCreation();
	nexus.NexusSpawn();
	
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