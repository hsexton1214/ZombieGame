PFont f;

void setup() {
  size(1200,700);
  f = createFont("LucidaSans-TypewriterBold-48",36,true); 
  
}

void draw() {
  background(255,204,0);


  textFont(f);       
  fill(0);

  textAlign(CENTER);
  text("This text is centered.",width/2,60);  
  
  if (mousePressed == true) {
    fill(255); // White
  } else {
    fill(0); // Black
  }
  rect(25, 25, 50, 50);

}