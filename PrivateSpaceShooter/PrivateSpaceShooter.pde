World world;
Nexus nexus;


void setup() {
world = new World();
nexus = new Nexus();
size(1920, 1080);
background(0);
}	

void draw() {

	nexus.NexusSpawn();
}
