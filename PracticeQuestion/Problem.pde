class Problem {
  float max = 10;

  float time;
  float speed;
  float distance;
  // type is 0, 1, or 2
  // 0 - unknown variable is time
  // 1 - unknown variable is speed
  // 2 - unknown variable is distance
  int type;
  
  Problem() {
   time = random(1, max);
   speed = random(1, max);
   distance = time*speed;
   type = int(random(int(0), int(3)));
   }
   
   float getTime() {
   return time;
   }
   
   float getSpeed() {
   return speed;
   }
   
   float getDistance() {
   return distance;
   }
   
   int getType() {
   return type;
   }
   
   String writeQuestion() {
   String question;
   if (type == 0) {
   question = "If you have traveled " + distance + " distance traveling at";
   } else if (type == 1) {
   question = "If you have traveled " + distance + " distance in ";
   } else if (type == 2) {
   question = "If you travel at " + speed + " speed";
   } else {
   question = "ERROR";
   }
   
   return question;
   }
   
  
}