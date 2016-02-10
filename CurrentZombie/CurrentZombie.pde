PFont f; //<>//
PFont g;
GameState gameState;

boolean startButtonCheck;
Button startButton;
boolean helpButtonCheck;
Button helpButton;
boolean returnMainButtonCheck;
Button returnMainButton;
boolean playButtonCheck;
Button playButton;
boolean exitGameButtonCheck;
Button exitGameButton;

void setup() {
  size(1200, 700);

  f = createFont("LucidaSans-TypewriterBold-48", 36, true);
  g = createFont("PalatinoLinotype-BoldItalic-48", 36, true);
  gameState = GameState.STARTMENU;
}

void draw() {


  switch(gameState) {
  case STARTMENU:
    background(0, 175, 47);
    StartMenu startPage = new StartMenu();

    startPage.printTitle(f);

    startButton = new Button(450, 375, 300, 100);
    startButton.setColor(189, 114, 48);
    startButton.setButtonName("Play Game");
    startButtonCheck = true;
    startButton.setCurrentPage(gameState);
    startButton.setLink(GameState.GAMEPAGE);
    startButton.printButton();

    helpButton = new Button(450, 525, 300, 100);
    helpButton.setColor(189, 114, 48);
    helpButton.setButtonName("How to Play");
    helpButtonCheck = true;
    helpButton.setCurrentPage(gameState);
    helpButton.setLink(GameState.MAINHELP);
    helpButton.printButton();
    break;


  case MAINHELP:
    background(33, 107, 204);
    playButton = new Button(100, 550, 200, 100);
    playButtonCheck = true;
    playButton.setColor(189, 114, 48);
    playButton.setButtonName("Start Game");
    playButton.setCurrentPage(gameState);
    playButton.setLink(GameState.GAMEPAGE);
    playButton.printButton();

    returnMainButton = new Button(900, 550, 200, 100);
    returnMainButtonCheck = true;
    returnMainButton.setColor(189, 114, 48);
    returnMainButton.setButtonName("Main Menu");
    returnMainButton.setCurrentPage(gameState);
    returnMainButton.setLink(GameState.STARTMENU);
    returnMainButton.printButton();
    break;

  case GAMEPAGE:
    background(255, 255, 255);
    exitGameButton = new Button(900, 550, 200, 100);
    exitGameButtonCheck = true;
    exitGameButton.setColor(189, 114, 48);
    exitGameButton.setButtonName("Exit Game");
    exitGameButton.setCurrentPage(gameState);
    exitGameButton.setLink(GameState.STARTMENU);
    exitGameButton.printButton();
    break;
  default:
  }
}



void mouseReleased() {
  if (startButtonCheck) {
    gameState = startButton.buttonPress(mouseX, mouseY);
    startButtonCheck = false;
  }
  if (helpButtonCheck) {
    gameState = helpButton.buttonPress(mouseX, mouseY);
    helpButtonCheck = false;
  }
  if (returnMainButtonCheck) {
    gameState = returnMainButton.buttonPress(mouseX, mouseY);
    returnMainButtonCheck = false;
  }
  if (playButtonCheck) {
    gameState = playButton.buttonPress(mouseX, mouseY);
    playButtonCheck = false;
  }
  if(exitGameButtonCheck){
    gameState = exitGameButton.buttonPress(mouseX,mouseY);
    exitGameButtonCheck = false;
  }
}

/*
boolean startButtonCheck;
 Button startButton;
 boolean helpButtonCheck;
 Button helpButton;
 boolean returnMainButtonCheck;
 Button returnMainButton;
 boolean playButtonCheck;
 Button playButton;*/