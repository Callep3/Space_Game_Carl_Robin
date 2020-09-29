World world;
Nexus nexus;
Time myTime;
Player player;
SpawnManager spawnManager;

//Bullet
Bullet bullet;
Bullet[] bullets;
int bulletSize = 10;
float bulletSpawnCd = 200; //1000 == 1 second
float bulletSpeed = 300;

//Enemy
Enemies[] enemies;
int enemySize = 20;
float enemySpeed = 50.0;
float enemySpawnCd = 1000; //1000 == 1 second


void setup() {
	world = new World();
	nexus = new Nexus();
	size(1920, 1014);
	background(0);
	surface.setLocation(-1923, 4);
	enemies = new Enemies[0];

	bullets = new Bullet[0];

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

	for(int i = 0; i < bullets.length; i++) {
		bullets[i].update();
		bullets[i].draw();
	}

	for (int i = 0; i < enemies.length; ++i) {
		enemies[i].update();
		enemies[i].draw();
	}

	spawnManager.update();
}