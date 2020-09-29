World world;
Nexus nexus;
Time myTime;
Player player;
SpawnManager spawnManager;
//Enemy
Enemies[] enemies;
int enemySize = 20;
float enemySpeed = 50.0;
float enemySpawnCd = 2000; //1000 == 1 second


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
}

void draw() {
	myTime.DeltaTime();
	world.worldCreation();
	nexus.NexusSpawn();
	player.update();
	player.draw();

	for (int i = 0; i < enemies.length; ++i) {
		enemies[i].update();
		enemies[i].draw();
	}
	
	spawnManager.update();
}