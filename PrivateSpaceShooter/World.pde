int borderWidth = 5;
int jumpPointSize = 15;
int jumpDotSize = 3;

class World {
	void worldCreation() {
		//background
		image(backgroundImage, 0, 0);


		//Lines
		strokeWeight(2);
		rectMode(CENTER);
		fill(100);
		rect(width/2, height/2, width, borderWidth);
		rect(width/2, height/2, borderWidth, height);


		//Nexus
		ellipseMode(CENTER);
		fill(20, 230, 151);
		ellipse(width/2, height/2, nexusSize, nexusSize);
		image(nexusImage, width/2-75, height/2-75);

		//NexusHealth
		fill(255, 169, 140);
		textAlign(CENTER);
		textSize(50);
		text(nexusHealth, width/2, height/2 + 15);


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
