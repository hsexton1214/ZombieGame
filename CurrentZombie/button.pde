class button {
  int xPos;
  int yPos;
  int xSize;
  int ySize;
  String buttonName;
  boolean pressed;
  button(int xP, int yP, int xS, int yS) {
    xPos = xP;
    yPos = yP;
    xSize = xS;
    ySize = yS;
  }

  void setButtonName(String name) {
    buttonName = name;
  }

  private boolean mouseIsOver() {
    if (mouseX > xPos && mouseX < (xPos+xSize) && mouseY > yPos && mouseY < (yPos+ySize)) {
      return true;
    } else {
      return false;
    }
  }

  boolean buttonPress() {
    

    
    
    return true;
  }

  void setColor() {
  }

  void printButton() {
    rect(xPos, yPos, xSize, ySize);
  }
}