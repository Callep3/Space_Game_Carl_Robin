//Author: Carl & Lindevy

//Classes
World world;
Nexus nexus;
Time myTime;
Player player;
SpawnManager spawnManager;
Collision collision;
Shields shields;
UserInterface userInterface;
GameRunning gameRunning;
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
	gameRunning = new GameRunning();

	enemies = new Enemy[0];
	playerBullets = new PlayerBullet[0];
	enemyBullets = new EnemyBullet[0];
	player = new Player(0, 0);

	size(1920, 1000);
	shields.setup();
}


void draw() {
	if(startGame && nexusHealth > 0) {
		gameRunning.update();
	}

	if(!startGame) {
		userInterface.startMenu();
	}

	if (nexusHealth <= 0) {
		userInterface.gameOverScreen();
	}
}