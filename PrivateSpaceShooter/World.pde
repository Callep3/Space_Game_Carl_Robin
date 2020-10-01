int borderWidth = 5;
int jumpPointSize = 15;

class World {
	void worldCreation() {
		//Background
		background(0);


		//Lines
		strokeWeight(2);
		rectMode(CENTER);
		fill(180);
		rect(width/2, height/2, width, borderWidth);
		rect(width/2, height/2, borderWidth, height);


		//Nexus
		ellipseMode(CENTER);
		fill(0, 220, 0);
		ellipse(width/2, height/2, nexusSize, nexusSize);
		//NexusHealth
		fill(0);
		textAlign(CENTER);
		textSize(50);
		text(nexusHealth, width/2, height/2 + 15);


		//jumpPoints
		fill(255, 255, 0);
		ellipse(width/4*1.4, height/4, jumpPointSize, jumpPointSize);
		ellipse(width/4*2.6, height/4, jumpPointSize, jumpPointSize);
		ellipse(width/4*1.4, height/4*3, jumpPointSize, jumpPointSize);
		ellipse(width/4*2.6, height/4*3, jumpPointSize, jumpPointSize);


		
	}
}
