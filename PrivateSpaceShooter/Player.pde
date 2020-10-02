//Author: Lindevy

int playerSize = 33;

class Player {
	PVector position, topLeft, topRight, bottomLeft, bottomRight;
	boolean topLeftPoint, topRightPoint, bottomLeftPoint, bottomRightPoint;
	float speed = 2500;
	int size = playerSize;


	Player(float x, float y) {
		topLeft = new PVector(width/4*1.4, height/4);
		bottomLeft = new PVector(width/4*1.4, height/4*3);
		topRight = new PVector(width/4*2.6, height/4);
		bottomRight = new PVector(width/4*2.6, height/4*3);
		//Default starting point
		position = new PVector(topLeft.x, topLeft.y);
	}

	void update() {
		positionCheck();

		//Movement
		if(topLeftPoint) {
			isUpperLeft();
		}
		if(topRightPoint) {
			isUpperRight();
		}
		if(bottomLeftPoint) {
			isLowerLeft();
		}
		if(bottomRightPoint) {
			isLowerRight();
		}
	}


	void draw() {
		//Player is UFO
		fill(200, 252, 234);
		strokeWeight(1);
		ellipse(position.x, position.y, size, size);
		fill(0);
		ellipse(position.x + 13, position.y, 3, 3);
		ellipse(position.x - 13, position.y, 3, 3);
		ellipse(position.x, position.y + 13, 3, 3);
		ellipse(position.x, position.y - 13, 3, 3);
		ellipse(position.x + 9.5, position.y + 9.5, 3, 3);
		ellipse(position.x - 9.5, position.y + 9.5, 3, 3);
		ellipse(position.x + 9.5, position.y - 9.5, 3, 3);
		ellipse(position.x - 9.5, position.y - 9.5, 3, 3);
		fill(20, 230, 151);
		ellipse(position.x, position.y, size-15, size-15);
	}


	void positionCheck() {
		if(position.x == topLeft.x && position.y == topLeft.y) {
			topLeftPoint = true;
		}
		if(position.x == topRight.x && position.y == topRight.y) {
			topRightPoint = true;
		}
		if(position.x == bottomLeft.x && position.y == bottomLeft.y) {
			bottomLeftPoint = true;
		}
		if(position.x == bottomRight.x && position.y == bottomRight.y) {
			bottomRightPoint = true;
		}
	} 


	void isUpperLeft() {
		if (topLeftPoint) {
			//Move down
			if(down) {
				if(moveAnimation) {
					position.y += speed * deltaTime;
				}

				if(position.y >= bottomLeft.y) {
					position.y = bottomLeft.y;

					down = false;
					topLeftPoint = false;
					moveAnimation = false;
				}
			}

			//Move right
			if(right) {
				if(moveAnimation) {
					position.x += speed * deltaTime;
				}

				if(position.x >= bottomRight.x) {
					position.x = bottomRight.x;

					right = false;
					topLeftPoint = false;
					moveAnimation = false;
				}
			}

			if(left) {
				left = false;
				topLeftPoint = false;
				moveAnimation = false;
			}
			if(up) {
				up = false;
				topLeftPoint = false;
				moveAnimation = false;
			}
		}
	}


	void isUpperRight() {
		if (topRightPoint) {
			//Move down
			if(down) {
				if(moveAnimation) {
					position.y += speed * deltaTime;
				}
				if(position.y >= bottomRight.y) {
					position.y = bottomRight.y;

					down = false;
					topRightPoint = false;
					moveAnimation = false;
				}
			}

			//Move left
			if(left) {
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
			
			if(right) {
				right = false;
				topRightPoint = false;
				moveAnimation = false;
			}
			if(up) {
				up = false;
				topRightPoint = false;
				moveAnimation = false;
			}
		}
	}


	void isLowerLeft() {
		if (bottomLeftPoint) {
			//Move up
			if(up) {
				if(moveAnimation) {
					position.y -= speed * deltaTime;
				}
				if(position.y <= topLeft.y) {
					position.y = topLeft.y;

					up = false;
					bottomLeftPoint = false;
					moveAnimation = false;
				}
			}

			//Move right
			if(right) {
				if(moveAnimation) {
					position.x += speed * deltaTime;
				}
				if(position.x >= bottomRight.x) {
					position.x = bottomRight.x;

					right = false;
					bottomLeftPoint = false;
					moveAnimation = false;
				}
			}
			
			if(left) {
				left = false;
				bottomLeftPoint = false;
				moveAnimation = false;
			}
			if(down) {
				down = false;
				bottomLeftPoint = false;
				moveAnimation = false;
			}
		}
	}


	void isLowerRight() {
		if (bottomRightPoint) {
			//Move up
			if(up) {
				if(moveAnimation) {
					position.y -= speed * deltaTime;
				}
				if(position.y <= topRight.y) {
					position.y = topRight.y;

					up = false;
					bottomRightPoint = false;
					moveAnimation = false;
				}
			}

			//Move left
			if(left) {
				if(moveAnimation) {
					position.x -= speed * deltaTime;
				}
				if(position.x <= bottomLeft.x) {
					position.x = bottomLeft.x;

					left = false;
					bottomRightPoint = false;
					moveAnimation = false;
				}
			}
			
			if(right) {
				right = false;
				bottomRightPoint = false;
				moveAnimation = false;
			}
			if(down) {
				down = false;
				bottomRightPoint = false;
				moveAnimation = false;
			}
		}
	}
}