class World {
	
	void worldCreation() {
		strokeWeight(2);
		rectMode(CENTER);
		fill(255);
		rect(width/2, height/2, width, 10);
		rect(width/2, height/2, 10, height);


		//Nexus
		ellipseMode(CENTER);
		fill(0, 220, 0);
		ellipse(width/2, height/2, 150, 150);


		//jumpPoints
		fill(0, 255, 255);
		ellipse(width/4, height/4, 20, 20);
		ellipse(width/4*3, height/4, 20, 20);
		ellipse(width/4, height/4*3, 20, 20);
		ellipse(width/4*3, height/4*3, 20, 20);

		//fakePlayer
		fill(255, 255, 0 );
		ellipse(width/4, height/4, 30, 30);

	}	
}
