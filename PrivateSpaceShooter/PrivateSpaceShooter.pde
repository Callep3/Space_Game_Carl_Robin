
World world;
Nexus nexus;
Time myTime;
Player player;
Enemies myEnemy;
Enemies[] enemies;
int enemySize = 20;
float enemySpeed = 100.0;


void setup() {
world = new World();
nexus = new Nexus();
size(1920, 1014);
background(0);
//Remove Before Pushing
surface.setLocation(-1923, 4);
myEnemy = new Enemies(random(-enemySize, width + enemySize), enemySize);
player = new Player(width / 4, height / 4);
myTime = new Time();
}

void draw() {
	myTime.DeltaTime();
	world.worldCreation();
	nexus.NexusSpawn();
	player.update();
	player.draw();
	myEnemy.update();
	myEnemy.draw();
}
