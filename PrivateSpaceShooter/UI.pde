int score = 0;
int timeAlive;
boolean startGame;
class UserInterface {
	boolean blackenBackground;
	
	
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
		if(!startGame) {
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

			//jumpPoints
			fill(158, 151, 205);
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
			text("Press 'G' when you are ready to start the game.", width/2, height/2.5);

		}
	}

	void gameOverScreen() {
			//Nexus
			ellipseMode(CENTER);
			fill(0, 200, 151);
			ellipse(width/2, height/2, nexusSize, nexusSize);
			image(nexusImage, width/2-75, height/2-75);
			//NexusHealth
			fill(255);
			textAlign(CENTER);
			textSize(50);
			text(nexusHealth, width/2, height/2 + 15);
			//Game Over Text

			if(blackenBackground == false) {
				fill(0, 130);
				rect(0, 0, width*2, height*2);
				blackenBackground = true;
			}
			stroke(0);
			strokeWeight(3);
			textAlign(CENTER);
			fill(255);
			textSize(100);
			text("Game Over!", width/2, height/3);
			textSize(36);
			text("You got a score of " + score + " and survived for " + timeAlive + " seconds!", width/2, height/2.5);
      highScore();
	}

  void highScore() {
    
    File file = new File("data/highScore.txt");
    if(file.length() == 0) {
        String newHighScore = str(0);
        String[] highScore = split(newHighScore, ' ');
        saveStrings("data/highScore.txt", highScore);
    }
    
    String[] currentHighScore = loadStrings("data/highScore.txt");
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
