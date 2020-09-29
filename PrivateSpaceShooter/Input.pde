boolean up, down, left, right, moveAnimation; //isMoving är ett bättre variabel namn i det här sammanhanget

void keyPressed() {
	if(key == 'w' && moveAnimation == false) {
		up = true;
		moveAnimation = true;
	}
	if(key == 's' && moveAnimation == false) {
		down = true;
		moveAnimation = true;
	}
	if(key == 'a' && moveAnimation == false) {
		left = true;
		moveAnimation = true;
	}
	if(key == 'd' && moveAnimation == false) {
		right = true;
		moveAnimation = true;
	}
}