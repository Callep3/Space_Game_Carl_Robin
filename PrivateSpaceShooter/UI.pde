int score = 0;
int timeAlive;
boolean startGame;
class UserInterface {
	
	


	void update() {
		timeAlive();
	}

	void draw() {
		fill(255);
		textSize(40);
		textAlign(LEFT);
		text("Score: " + score, 30, 60);
	}

	void timeAlive() {
		long currentTime = millis();
		timeAlive = int(currentTime * 0.001);

	}

	void startMenu() {
		if(startGame == false) {
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

			//jumpPoints
			fill(255, 255, 0);
			ellipse(width/4*1.4, height/4, jumpPointSize, jumpPointSize);
			ellipse(width/4*2.6, height/4, jumpPointSize, jumpPointSize);
			ellipse(width/4*1.4, height/4*3, jumpPointSize, jumpPointSize);
			ellipse(width/4*2.6, height/4*3, jumpPointSize, jumpPointSize);


			//title
			fill(255);
			textSize(100);
			textAlign(CENTER);
			text("Exaple Text", width/2, height/3);

			textSize(36);
			text("Press 'G' when you are ready to start the game", width/2, height/2.5);

		}
	}

	void gameOverScreen() {
		//Nexus
			ellipseMode(CENTER);
			fill(0, 220, 0);
			ellipse(width/2, height/2, nexusSize, nexusSize);
			//NexusHealth
			fill(0);
			textAlign(CENTER);
			textSize(50);
			text(nexusHealth, width/2, height/2 + 15);
			//Game Over Text
			stroke(0);
			strokeWeight(3);
			textAlign(CENTER);
			fill(255);
			textSize(250);
			text("Game Over!", width/2, height/3);
			textSize(45);
			text("You got a score of " + score + " and survived for " + timeAlive + " seconds!", width/2, height/2.2);
			return;
	}
}