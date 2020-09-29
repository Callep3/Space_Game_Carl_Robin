int nexusSize = 150;

class Nexus {
	PVector position= new PVector(width/2, height/2);
	int size = nexusSize;
	void NexusSpawn() {
		ellipseMode(CENTER);
		fill(0, 220, 0);
		ellipse(position.x, position.y, size, size);
	}
}
  
