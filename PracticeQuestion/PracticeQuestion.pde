String a;
PFont f;
Problem hi;

void setup() {
  size(1200,700);
  f = createFont("Calibri-48.vlw",48,true);
  a = "";
}

void draw() {
  fill(189,114,48);
  rect(450,300,300,100);
  //for(int i=0;i<10;i++){
    
    //if need new problem
  hi= new Problem();
  //  println("time "+ i + " = " + a.getTime());
  //  println("speed "+ i + " = " + a.getSpeed());
   // println("distance "+ i + " = " + a.getDistance());
   // println("type "+ i + " = " + a.getType());
    println(hi.writeQuestion());
   // println("");
  //}
  textFont(f);
  fill(0,0,0);
 // textAlign(CENTER);
 // text(hi.writeQuestion(),200,100);
 // textAlign(LEFT);
  text(a,475,375);
}

void keyPressed() {
  a = a + key;
}