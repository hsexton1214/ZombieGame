

void setup() {
  size(1200,700);
}

void draw() {
  for(int i=0;i<10;i++){
    Problem a= new Problem();
    //println("time "+ i + " = " + a.getTime());
    println("speed "+ i + " = " + a.getSpeed());
    println("distance "+ i + " = " + a.getDistance());
    println("type "+ i + " = " + a.getType());
    println(a.writeQuestion());
    println("");
  }
}