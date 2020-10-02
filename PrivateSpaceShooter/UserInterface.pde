int score = 0;
int timeAlive;
boolean startGame;

class UserInterface {
	boolean blackenBackground;
	boolean lastNexusHealthUpdate;

	
	void update() {
		timeAlive();
	}


	void draw() {
		fill(255);
		textAlign(LEFT);
		textSize(40);
		text("Score: " + score, 30, 60);
	}


	void timeAlive() {
		timeAlive = int(time * 0.001);
	}


	void startMenu() {
		if(!startGame) {
			//background
			image(backgroundImage, 0, 0);

			//Lines
			fill(100);
			strokeWeight(2);
			rectMode(CENTER);
			rect(width/2, height/2, width, borderThickness);
			rect(width/2, height/2, borderThickness, height);

			//Nexus
			image(nexusImage, width/2-75, height/2-75);

			//Title
			fill(255);
			textAlign(CENTER);
			textSize(100);
			text("Example Text", width/2, height/3);

			textSize(36);
			text("Press 'G' when you are ready to start the game.", width/2, height/2.5);
		}
	}


	void gameOverScreen() {
		if (lastNexusHealthUpdate == false) {
			//Nexus
			image(nexusImage, width/2 - 75, height/2 - 75);

			//NexusHealth
			fill(255, 169, 140);
			textAlign(CENTER);
			textSize(50);
			text(nexusHealth, width/2, height/2 + 15);

			lastNexusHealthUpdate = true;
		}

		if(blackenBackground == false) {
			fill(0, 130);
			rect(0, 0, width*2, height*2);

			blackenBackground = true;
		}

		//Game over text
		stroke(0);
		strokeWeight(3);
		fill(255);
		textAlign(CENTER);
		textSize(100);
		text("Game Over!", width/2, height/3);
		textSize(36);
		text("You got a score of " + score + " and survived for " + timeAlive + " seconds!", width/2, height/2.5);
		highScore();
	}

	void highScore() {
		//If no highscore then highscore is 0
		File file = new File("data/highScore.txt");
		if(file.length() == 0) {
			String newHighScore = str(0);
			String[] highScore = split(newHighScore, ' ');
			saveStrings("data/highScore.txt", highScore);
		}

		//Get previous highscore
		String[] currentHighScore = loadStrings("data/highScore.txt");

		//If new score is greater than previous highscore then that becomes the new highscore
		if(currentHighScore != null) {
			int HighScore = 0;

			for(int i = 0; i < currentHighScore.length; i++) {
				HighScore = Integer.parseInt(currentHighScore[i]);
			}

			if(HighScore > score) {
				textSize(48);
				text("High score: " + HighScore, width/2, height/1.5);
			}

			if(score > HighScore) {
				String newHighScore = str(score);
				String[] highScore = split(newHighScore, ' ');
				saveStrings("data/highScore.txt", highScore);
				
				textSize(48);
				text("You got a new high score!", width/2, height/1.5);
			}
		}
	}
}
