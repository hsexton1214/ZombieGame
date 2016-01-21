class EquationData {
  float distance;
  float speed;
  float time;
  int x, y;
  String sDistance, sSpeed;
  //Constructor Function
  EquationData(float d, float s, int xx, int yy) {
    distance = d;
    speed = s;
    sDistance = nf(distance, 3, 1);
    sSpeed = nf(speed, 1, 1);
    time = distance/speed;
    x = xx;
    y = yy;
  }
  //Function to call Time
  float getTime() {
    return time;
  }

  void displaytext() {
    //Shadow Text for Equations
    fill(80);
    textFont(distFont, 28);
    text(sDistance + "mi.  " + sSpeed + "mph", x+3, y);

    //Main Textt
    fill(255, 255, 2);
    textFont(distFont, 28);
    text(sDistance + "mi.  " + sSpeed + "mph", x, y);
  }
  //This is for the next update to this game!
//  boolean checkMousePress() {
//    mX = mouseX;
//    mY = mouseY;
//    return (mX > x && mX < 275/2 && mY > y && mY < y + 175/2);
//  }
}

