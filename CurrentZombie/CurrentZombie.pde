PFont f;  //<>//
PFont fSmall;
GameState gameState;

PImage img;

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
StartMenu startPage;
MainHelp mainHelpPage;

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
    startPage = new StartMenu();
    startPage.printTitle(f);
    startButton = new Button(450, 375, 300, 100);
    startPage.startButtonSetUp();
    helpButton = new Button(450, 525, 300, 100);
    startPage.helpButtonSetUp();
    break;

  case MAINHELP:
    background(33, 107, 204);
    mainHelpPage = new MainHelp();
    playButton = new Button(100, 550, 200, 100);
    mainHelpPage.playButtonSetUp();
    returnMainButton = new Button(900, 550, 200, 100);
    mainHelpPage.returnMainButtonSetUp();
    break;

  case gamePage:
    background(255, 255, 255);
    gameScreen = new GamePage();
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
    gameScreen.submitButtonSetUp();
    inGameHelpButton = new Button(950, 100, 200, 75);
    gameScreen.inGameHelpButtonSetUp();
    exitGameButton = new Button(950, 200, 200, 75);
    gameScreen.exitGameButtonSetUp();
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
      gameScreen.problemCorrect();
    } else{
      gameScreen.problemWrong();
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