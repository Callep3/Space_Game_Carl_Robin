class World {
	
	void worldCreation() {
		//Background
		background(0);


		//Lines
		strokeWeight(2);
		rectMode(CENTER);
		fill(180);
		rect(width/2, height/2, width, 5);
		rect(width/2, height/2, 5, height);


		//Nexus
		ellipseMode(CENTER);
		fill(0, 220, 0);
		ellipse(width/2, height/2, 150, 150);


		//jumpPoints
		fill(0, 255, 255);
		ellipse(width/4*1.4, height/4, 20, 20);
		ellipse(width/4*2.6, height/4, 20, 20);
		ellipse(width/4*1.4, height/4*3, 20, 20);
		ellipse(width/4*2.6, height/4*3, 20, 20);

	}	
}
