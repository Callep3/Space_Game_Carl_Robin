
class Player {
	PVector position;

	Player(float x, float y) {
		position = new PVector(x, y);
	}

	void update() {
		if(down) {
			down();
		}
		movement();
	}


	void draw() {
		fill(255, 255, 0 );
		ellipse(position.x, position.y, 30, 30);
	}

	void movement() {

		//top-left
		//if (position.x == width/4 && position.y == height/4) {
		//	if(down) {
		//		position.y = height/4*3;
		//	}
		//	if(right) {
		//		position.x = width/4*3;
		//	}
		//}

		//top-right
		if (position.x == width/4*3 && position.y == height/4) {
			if(down) {
				position.y = height/4*3;
			}
			if(left) {
				position.x = width/4;
			}
		}

		//bottom-right
		if (position.x == width/4*3 && position.y == height/4*3) {
			if(up) {
				position.y = height/4;
			}
			if(left) {
				position.x = width/4;
			}
		}

		//bottom-left
		if (position.x == width/4 && position.y == height/4*3) {
			if(up) {
				position.y = height/4;
			}
			if(right) {
				position.x = width/4*3;
			}
		}
	}

	void down() {
			if(position.y != height/4*3) {
				position.y += 3;
			}	
	}
}