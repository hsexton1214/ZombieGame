class Button {
  int xPos;
  int yPos;
  int xSize;
  int ySize;
  String buttonName;
  boolean pressed;
  boolean link;
  boolean currentPage;
  
  Button(int xP, int yP, int xS, int yS) {
    xPos = xP;
    yPos = yP;
    xSize = xS;
    ySize = yS;
  }
  
  void setCurrentPage(boolean page){
    currentPage = page;
  }
  
  void setLink(boolean page){
    link = page;
  }

  void setButtonName(String name) {
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
 void buttonPress(int mx, int my) {
    if(mouseIsOver(mx, my)){
    println("yeah!");}
    
  }

  void setColor() {
  }

  void printButton() {
    rect(xPos, yPos, xSize, ySize);
  }
}