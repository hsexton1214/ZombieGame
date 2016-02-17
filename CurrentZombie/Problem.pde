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
      question = String.format("If you have traveled %.2f distance traveling at %.2f speed how long did you travel?", distance, speed);
    } else if (type == 1) {
      question = String.format("If you have traveled %.2f distance in %.2f amount of time how long have you been traveling?", distance, time);
    } else if (type == 2) {
      question = String.format("If you travel at %.2f speed for %.2f time how far do you travel?", speed, time);
    } else {
      question = "ERROR";
    }
    return question;
  }
}