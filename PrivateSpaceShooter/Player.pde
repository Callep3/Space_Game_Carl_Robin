int playerSize = 30;

class Player {
	PVector position, topLeft, topRight, btmLeft, btmRight;
	boolean topLeftPoint, topRightPoint, btmRightPoint, btmLeftPoint;
	float speed = 2000;
	int size = playerSize;


	Player(float x, float y) {
		topLeft = new PVector(width/4*1.4, height/4);
		btmLeft = new PVector(width/4*1.4, height/4*3);
		topRight = new PVector(width/4*2.6, height/4);
		btmRight = new PVector(width/4*2.6, height/4*3);
		position = new PVector(topLeft.x, topLeft.y);
	}

	void update() {
		movement();
	}


	void draw() {
		fill(255, 255, 0);
		ellipse(position.x, position.y, size, size);
	}


	void movement() {
		//Check at which point the player is currently at.
		if(position.x == topLeft.x && position.y == topLeft.y) {
			topLeftPoint = true;
		}
		if(position.x == topRight.x && position.y == topRight.y) {
			topRightPoint = true;
		}
		if(position.x == btmLeft.x && position.y == btmLeft.y) {
			btmLeftPoint = true;
		}
		if(position.x == btmRight.x && position.y == btmRight.y) {
			btmRightPoint = true;
		}

		//top-left Point
		if(down && topLeftPoint) {
			if(moveAnimation) {
				position.y += speed * deltaTime;
			}
			if(position.y >= btmLeft.y) {
				position.y = btmLeft.y;
				down = false;
				topLeftPoint = false;
				moveAnimation = false;
			}
		}
		if(right && topLeftPoint) {
			if(moveAnimation) {
				position.x += speed * deltaTime;
			}
			if(position.x >= btmRight.x) {
				position.x = btmRight.x;
				right = false;
				topLeftPoint = false;
				moveAnimation = false;
			}
		}
		if(left && topLeftPoint) {
			left = false;
			topLeftPoint = false;
			moveAnimation = false;
		}
		if(up && topLeftPoint) {
			up = false;
			topLeftPoint = false;
			moveAnimation = false;
		}

		//top-right Point
		if(down && topRightPoint) {
			if(moveAnimation) {
				position.y += speed * deltaTime;
			}
			if(position.y >= btmRight.y) {
				position.y = btmRight.y;
				down = false;
				topRightPoint = false;
				moveAnimation = false;
			}
		}
		if(left && topRightPoint) {
			if(moveAnimation) {
				position.x -= speed * deltaTime;
			}
			if(position.x <= topLeft.x) {
				position.x = topLeft.x;
				left = false;
				topRightPoint = false;
				moveAnimation = false;
			}
		}
		if(right && topRightPoint) {
			right = false;
			topRightPoint = false;
			moveAnimation = false;
		}
		if(up && topRightPoint) {
			up = false;
			topRightPoint = false;
			moveAnimation = false;
		}

		//bottom-right Point
		if(up && btmRightPoint) {
			if(moveAnimation) {
				position.y -= speed * deltaTime;
			}
			if(position.y <= topRight.y) {
				position.y = topRight.y;
				up = false;
				btmRightPoint = false;
				moveAnimation = false;
			}
		}
		if(left && btmRightPoint) {
			if(moveAnimation) {
				position.x -= speed * deltaTime;
			}
			if(position.x <= btmLeft.x) {
				position.x = btmLeft.x;
				left = false;
				btmRightPoint = false;
				moveAnimation = false;
			}
		}
		if(right && btmRightPoint) {
			right = false;
			btmRightPoint = false;
			moveAnimation = false;
		}
		if(down && btmRightPoint) {
			down = false;
			btmRightPoint = false;
			moveAnimation = false;
		}

		//bottom-left Point
		if(up && btmLeftPoint) {
			if(moveAnimation) {
				position.y -= speed * deltaTime;
			}
			if(position.y <= topLeft.y) {
				position.y = topLeft.y;
				up = false;
				btmLeftPoint = false;
				moveAnimation = false;
			}
		} 
		if(right && btmLeftPoint) {
			if(moveAnimation) {
				position.x += speed * deltaTime;
			}
			if(position.x >= btmRight.x) {
				position.x = btmRight.x;
				right = false;
				btmLeftPoint = false;
				moveAnimation = false;
			}
		}
		if(left && btmLeftPoint) {
			left = false;
			btmLeftPoint = false;
			moveAnimation = false;
		}
		if(down && btmLeftPoint) {
			down = false;
			btmLeftPoint = false;
			moveAnimation = false;
		}
	} 
}