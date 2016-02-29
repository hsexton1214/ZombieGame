PFont f; //<>// //<>//
PFont fSmall;
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
boolean submitButtonCheck;
Button submitButton;
boolean inGameHelpButtonCheck;
Button inGameHelpButton;

boolean newProblem;
int count;
Problem currentProblem;
String answer;

GamePage gameScreen;


void setup() {
  size(1200, 700);

  f = createFont("LucidaSans-TypewriterBold-48", 36, true);
  fSmall = createFont("PalatinoLinotype-BoldItalic-48", 24, true);
  gameState = GameState.STARTMENU;
  count=0;
  answer="";
}

void draw() {


  switch(gameState) {
  case STARTMENU:
    background(0, 175, 47);
    StartMenu startPage = new StartMenu();

    startPage.printTitle(f);

    startButton = new Button(450, 375, 300, 100);
    startButton.setColor(189, 114, 48);
    startButton.setButtonName(f, "Play Game");
    startButtonCheck = true;
    startButton.setCurrentPage(gameState);
    startButton.setLink(GameState.gamePage);
    startButton.printButton();

    helpButton = new Button(450, 525, 300, 100);
    helpButton.setColor(189, 114, 48);
    helpButton.setButtonName(f, "How to Play");
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
    playButton.setButtonName(f, "Start Game");
    playButton.setCurrentPage(gameState);
    playButton.setLink(GameState.gamePage);
    playButton.printButton();

    returnMainButton = new Button(900, 550, 200, 100);
    returnMainButtonCheck = true;
    returnMainButton.setColor(189, 114, 48);
    returnMainButton.setButtonName(f, "Main Menu");
    returnMainButton.setCurrentPage(gameState);
    returnMainButton.setLink(GameState.STARTMENU);
    returnMainButton.printButton();
    break;

  case gamePage:
    background(255, 255, 255);
    PImage img;
    img = loadImage("Act1.png");
    image(img, 0, 0);
    fill(255, 255, 255);
    rect(300, 100, 600, 350);
    if (newProblem) {
      answer ="";
      newProblem = false;
      count= count + 1;
      currentProblem = new Problem();
    }
    fill(0);
    textAlign(CENTER);
    text(currentProblem.writeQuestion(), 350, 125, 500, 300);
    text("press enter to submit:", 500, 275);
    //text(count,500,200);
    fill(189, 114, 48);
    rect(375, 300, 300, 100);
    fill(0);
    textFont(f);
    textAlign(LEFT);
    text(answer, 400, 375);
    submitButton = new Button(700,300,100,50);
    submitButtonCheck=true;
    submitButton.setColor(100,200,48);
    submitButton.setButtonName(fSmall,"Submit");
    submitButton.printButton();
    
    inGameHelpButton = new Button(950, 100, 200, 75);
    inGameHelpButtonCheck = true;
    inGameHelpButton.setColor(189, 114, 48);
    inGameHelpButton.setButtonName(fSmall, "Help");
    inGameHelpButton.setCurrentPage(gameState);
    inGameHelpButton.printButton();

    exitGameButton = new Button(950, 200, 200, 75);
    exitGameButtonCheck = true;
    exitGameButton.setColor(189, 114, 48);
    exitGameButton.setButtonName(fSmall, "Exit Game");
    exitGameButton.setCurrentPage(gameState);
    exitGameButton.setLink(GameState.STARTMENU);
    exitGameButton.printButton();
    break;

  default:
  }
}



void mouseReleased() {
  //println(startButtonCheck, helpButtonCheck, mouseX, mouseY);
  if (startButtonCheck && gameState != GameState.MAINHELP) {
    gameState = startButton.buttonPressLink(mouseX, mouseY);
    startButtonCheck = false;
    newProblem =true;
  }
  if (helpButtonCheck && gameState != GameState.gamePage) {
    gameState = helpButton.buttonPressLink(mouseX, mouseY);
    helpButtonCheck = false;
  }
  if (returnMainButtonCheck && gameState != GameState.gamePage) {
    gameState = returnMainButton.buttonPressLink(mouseX, mouseY);
    returnMainButtonCheck = false;
  }
  if (playButtonCheck && gameState != GameState.STARTMENU) {
    gameState = playButton.buttonPressLink(mouseX, mouseY);
    playButtonCheck = false;
  }
  if (exitGameButtonCheck) {
    gameState = exitGameButton.buttonPressLink(mouseX, mouseY);
    exitGameButtonCheck = false;
  }
  if(submitButtonCheck){
    submitButtonCheck = false;
    if(currentProblem.checkAnswer(answer)){
      
    }
  }
}

void keyPressed() {
  if (keyCode == ENTER) {
    if (currentProblem.checkAnswer(answer)) {
      println("correct");
    } else {
      println("wrong");
    }
    newProblem = true;
  }
  //number or period
  if ((key >= '0' && key <= '9') || key == '.') {
    answer = answer + key;
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