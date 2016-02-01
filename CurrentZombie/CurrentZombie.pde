PFont f;
PFont g;

boolean startMenuOn;
boolean mainHelpOn;
boolean gamePageOn;
Button startButton;

void setup() {
  size(1200, 700);
  startMenuOn = true;
  mainHelpOn = false;
  gamePageOn = false;

  f = createFont("LucidaSans-TypewriterBold-48", 36, true);
  g = createFont("PalatinoLinotype-BoldItalic-48", 36, true);
}

void draw() {
  
  
  if (startMenuOn) {
    background(255, 204, 0);
    StartMenu hi = new StartMenu();
    hi.printTitle(f);
    startButton = new Button(0, 0, 300, 100);
    startButton.printButton();


    /*   if (mousePressed == true) {
     mainHelpOn = true; // White
     } else {
     mainHelpOn = false;
     }
     rect(25, 25, 50, 50);*/
  }


  if (mainHelpOn) {
    background(0, 0, 0);
  }


  if (gamePageOn) {
  }
}


void mouseReleased(){
  startButton.buttonPress(mouseX, mouseY);
  println(mouseX, mouseY);
}