PFont f;
PFont g;
GameState gameState;

Button startButton;
Button helpButton;

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
    startButton.setColor(189,114,48);
    startButton.setButtonName("Play Game");
    startButton.setLink(GameState.MAINHELP);
    startButton.printButton();
    
    helpButton = new Button(450, 525, 300, 100);
    helpButton.setColor(189,114,48);
    helpButton.setButtonName("How to Play");
    helpButton.setLink(GameState.MAINHELP);
    helpButton.printButton();
    break;





  case MAINHELP:
    background(0, 0, 0);
    break;
   default:
  }
}



void mouseReleased() {
  gameState = startButton.buttonPress(mouseX, mouseY);
 
}