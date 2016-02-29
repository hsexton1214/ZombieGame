class GamePage {
  GamePage() {
  }
  void submitButtonSetUp() {
    submitButtonCheck=true;
    submitButton.setColor(100,200,48);
    submitButton.setButtonName(fSmall,"Submit");
    submitButton.printButton();
  }
  void inGameHelpButtonSetUp(){
    inGameHelpButtonCheck = true;
    inGameHelpButton.setColor(189, 114, 48);
    inGameHelpButton.setButtonName(fSmall, "Help");
    inGameHelpButton.setCurrentPage(gameState);
    inGameHelpButton.printButton();
  }
  void exitGameButtonSetUp(){
    exitGameButtonCheck = true;
    exitGameButton.setColor(189, 114, 48);
    exitGameButton.setButtonName(fSmall, "Exit Game");
    exitGameButton.setCurrentPage(gameState);
    exitGameButton.setLink(GameState.STARTMENU);
    exitGameButton.printButton();
  }
  void problemCorrect() {
    fill(142,142,56);
    rect(150,50,900,600);
    fill(0);
    textAlign(CENTER);
    text("Correct Answer",600, 150);
    nextProblemButtonCheck=true;
    nextProblemButton.setColor(189,114,48);
    nextProblemButton.setButtonName(fSmall,"Next Question");
    nextProblemButton.printButton();
  }
  void problemWrong() {
    fill(205,0,0);
    rect(150,50,900,600);
    fill(0);
    textAlign(CENTER);
    text("Incorrect Answer",600, 150);
     nextProblemButtonCheck=true;
    nextProblemButton.setColor(189,114,48);
    nextProblemButton.setButtonName(fSmall,"Next Question");
    nextProblemButton.printButton();
  }
}