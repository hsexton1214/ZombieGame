class StartMenu {
  StartMenu() {
  }

  void printTitle(PFont font) {
    textFont(font);       
    fill(0);
    textAlign(CENTER);
    text("Zombie Horde", width/2, 60);
  }

  void startButtonSetUp() {
    startButton.setColor(189, 114, 48);
    startButton.setButtonName(f, "Play Game");
    startButtonCheck = true;
    startButton.setCurrentPage(gameState);
    startButton.setLink(GameState.gamePage);
    startButton.printButton();
  }
  
  void helpButtonSetUp(){
     helpButton.setColor(189, 114, 48);
    helpButton.setButtonName(f, "How to Play");
    helpButtonCheck = true;
    helpButton.setCurrentPage(gameState);
    helpButton.setLink(GameState.MAINHELP);
    helpButton.printButton();
  }
}