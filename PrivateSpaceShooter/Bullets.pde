Bullet[] bullets;
int bulletSize = 10;
float bulletSpawnCd = 200; //1000 == 1 second
float bulletSpeed = 300;

class Bullet {
	PVector position, direction, mousePosition;
	int bulletVelocity = 600;
	int size = bulletSize;

	Bullet(float x, float y) {
		position = new PVector(x, y);
		direction = new PVector(0, 0);

		mousePosition = new PVector(0, 0);
		mousePosition.x = (mouseX);
		mousePosition.y = (mouseY);

		//Flyttade upp denna så stannar inte bulletsen
		direction.x = ((mousePosition.x - position.x) * 4);	//Varför dubbel parantes?
		direction.y = ((mousePosition.y - position.y) * 4); //Varför ha "* 4" på dessa om de nu sedan bara blir normalizade?
	}

	void update() {
		direction.normalize();

		position.add(direction.mult(bulletVelocity).mult(deltaTime));
	}


	void draw() {
		ellipseMode(CENTER);
		fill(255);
		ellipse(position.x, position.y, size, size); //Ändrade till "size" och gjorde en local int. Detta gör så att vi kan lätt använda Collision scriptsen
	}
}