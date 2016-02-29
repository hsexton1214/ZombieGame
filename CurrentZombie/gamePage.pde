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
    println("right");
  }
  void problemWrong() {
    println("wrong");
  }
}