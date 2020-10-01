int nexusSize = 150;
int nexusHealth = 20;

class Nexus {
	PVector position= new PVector(width/2, height/2);
	int size = nexusSize;

	void collision(int i) {
		if (collision.enemyBulletNexusCollision(enemyBullets[i], nexus)) {
			nexusHealth -= 1;
			enemyBullets[i].isRendered = false;
		}
	}
}
  
