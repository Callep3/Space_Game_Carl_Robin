//Author: Carl & Lindevy

int borderThickness = 5;
int jumpPointSize = 15;
int jumpDotSize = 3;

class World {
	void worldCreation() {
		image(backgroundImage, 0, 0);

		//Border Lines
		fill(100);
		strokeWeight(2);
		rectMode(CENTER);
		rect(width/2, height/2, width, borderThickness);
		rect(width/2, height/2, borderThickness, height);

		//jumpPoints
		fill(212, 175, 106);
		ellipse(width/4*1.4, height/4, jumpPointSize, jumpPointSize);
		ellipse(width/4*2.6, height/4, jumpPointSize, jumpPointSize);
		ellipse(width/4*1.4, height/4*3, jumpPointSize, jumpPointSize);
		ellipse(width/4*2.6, height/4*3, jumpPointSize, jumpPointSize);

		fill(0);
		ellipse(width/4*1.4, height/4, jumpDotSize, jumpDotSize);
		ellipse(width/4*2.6, height/4, jumpDotSize, jumpDotSize);
		ellipse(width/4*1.4, height/4*3, jumpDotSize, jumpDotSize);
		ellipse(width/4*2.6, height/4*3, jumpDotSize, jumpDotSize);
	}
}
