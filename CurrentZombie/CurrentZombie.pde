PFont f;

boolean startMenu;
boolean mainHelp;
boolean gameplay;

void setup() {
  size(1200, 700);
  startMenu = true;
  mainHelp = false;
  gameplay = false;
  



  f = createFont("LucidaSans-TypewriterBold-48", 36, true);
}

void draw() {
  if (startMenu) {
    background(255, 204, 0);


    textFont(f);       
    fill(0);

    textAlign(CENTER);
    text("This text is centered.", width/2, 60);  

    if (mousePressed == true) {
      mainHelp = true; // White
    } else {
      mainHelp = false;
    }
    rect(25, 25, 50, 50);
  }
  if (mainHelp) {
    background(0, 0, 0);
  }
}