class MainHelp{
  MainHelp(){}
  
  void playButtonSetUp(){
    playButtonCheck = true;
    playButton.setColor(189, 114, 48);
    playButton.setButtonName(f, "Start Game");
    playButton.setCurrentPage(gameState);
    playButton.setLink(GameState.gamePage);
    playButton.printButton();
  }
  
  void returnMainButtonSetUp(){
    returnMainButtonCheck = true;
    returnMainButton.setColor(189, 114, 48);
    returnMainButton.setButtonName(f, "Main Menu");
    returnMainButton.setCurrentPage(gameState);
    returnMainButton.setLink(GameState.STARTMENU);
    returnMainButton.printButton();
  }
}