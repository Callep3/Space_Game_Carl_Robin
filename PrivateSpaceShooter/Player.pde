int playerSize = 30;

class Player {
	PVector position, topLeft, topRight, btmLeft, btmRight;
	boolean topLeftPoint, topRightPoint, btmRightPoint, btmLeftPoint;
	float speed = 2500;
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
		if(topLeftPoint) {
			upperLeft();
		}
		if(topRightPoint) {
			upperRight();
		}
		if(btmLeftPoint) {
			lowerLeft();
		}
		if(btmRightPoint) {
			lowerRight();
		}
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
	} 


	void upperLeft() {
		//Move down
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
		//Move to the right
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
		//Do nothing
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
	}

	void upperRight() {
		//Move down
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
		//Move to the left
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
		//Do nothing
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
	}

	void lowerLeft() {
		//Move up
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
		//Move to the right
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
		//Do nothing
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

	void lowerRight() {
		//Move up
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
		//Move to the left
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
		//do Nothing
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
	}
}