class Button {
  int xPos;
  int yPos;
  int xSize;
  int ySize;
  String buttonName;
  boolean pressed;
  GameState link;
  GameState currentPage;
  int red;
  int green;
  int blue;

  Button(int xP, int yP, int xS, int yS) {
    xPos = xP;
    yPos = yP;
    xSize = xS;
    ySize = yS;
  }

  void setCurrentPage(GameState gameState) {
    currentPage = gameState;
  }

  void setLink(GameState gameState) {
    link = gameState;
  }

  void setButtonName(PFont f, String name) {
    textFont(f);
    buttonName = name;
  }

  private boolean mouseIsOver(int mx, int my) {
    if (mx > xPos && mx < (xPos+xSize) && my > yPos && my < (yPos+ySize)) {
      return true;
    } else {
      return false;
    }
  }

  // change current page to false and link to 1
  GameState buttonPressLink(int mx, int my) {
    if (mouseIsOver(mx, my)) {
      return link;
    } else{
      return currentPage;
    }
  }
  
  void buttonPressAction(int mx, int my){
    if(mouseIsOver(mx,my)){
      
    }
  }

  void setColor(int r, int g, int b) {
    red =r;
    green = g;
    blue =b;
  }

  void printButton() {
    fill(red, green, blue);
    rect(xPos, yPos, xSize, ySize);
    fill(0);
    textAlign(CENTER);
    text(buttonName, xPos +xSize/2, yPos +ySize/2+10);
  }
}