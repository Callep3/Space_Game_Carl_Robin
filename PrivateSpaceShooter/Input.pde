//Author: Carl & Lindevy

boolean up, down, left, right, moveAnimation, mouseHeld; 

void keyPressed() {
	if (moveAnimation == false) {
		if(key == 'w' || key == 'W') {
			up = true;
			moveAnimation = true;
		}
		if(key == 's' || key == 'S') {
			down = true;
			moveAnimation = true;
		}
		if(key == 'a' || key == 'A') {
			left = true;
			moveAnimation = true;
		}
		if(key == 'd' || key == 'D') {
			right = true;
			moveAnimation = true;
		}
	}
	if(key == 'g' || key == 'G') {
		startGame = true;
	}
}


void mousePressed() {
	mouseHeld = true;
}


void mouseReleased() {
	mouseHeld = false;
}
