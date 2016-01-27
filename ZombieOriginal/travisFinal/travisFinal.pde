//All audio files courtesy of http://www.freesfx.co.uk
import ddf.minim.*;
Minim minim;
AudioPlayer playerIntro, playerGame, playerWrong, playerRight;

PImage Railroad, Prison, Ocean, Circle, Amusement, Horde, Zombie, Safe, MapBackground;
PFont gameFont, distFont, titleFont;
EquationData [] eData = new EquationData[5];
float minTime = 100000;
float minIndex = 10;
float total;
int userKey;
boolean newGame = true, clear = true, showHelp = false, start = true, checkAnswer = false;

void setup() {
  size(1200, 700);
  minim = new Minim(this);
  playerIntro = minim.loadFile("dantes_zoo_sound_design_created_through_sound_manipulation_in_fmod.mp3");
  playerGame = minim.loadFile("sound_design_texture_dark_scifi_002.mp3");
  playerWrong = minim.loadFile("horror_monster_scream_001.mp3");
  playerRight = minim.loadFile("bugle_music_chargel.mp3");
  titleFont = loadFont("MarkerFelt-Wide-100.vlw");
  gameFont = loadFont("MarkerFelt-Wide-40.vlw");
  distFont = loadFont("TimesNewRomanPS-BoldMT-40.vlw");
  Horde = loadImage("zombieclown1.jpeg");
  Railroad = loadImage("Railroad station.jpg");
  Prison = loadImage("Prison Cell.jpg");
  Ocean = loadImage("ocean homes.jpg");
  Circle = loadImage("circle homes.jpg");
  Amusement = loadImage("amusementpark2.jpg");
  Zombie = loadImage("zombiewrong1.jpg");
  Safe = loadImage("wire-metal-thread-barbed-wire-zurich.jpg");
  MapBackground = loadImage("grungeworldmap.jpg");
}

void draw() {

  //Title Screen
  if (start) {
    playerIntro.play();
    textFont(titleFont, 100);
    imageMode(CENTER);
    image(Horde, 600, 350, 1200, 700);
    fill(40,235,0);
    text("ZOMBIE HORDE", 315, 120);
    fill(255, 0, 0);
    text("ZOMBIE HORDE", 310, 120);
    textFont(gameFont, 40);
    fill(40,235,0);
    text("Press 'Space Bar' to begin game!", 383, 670);
    fill(255, 0, 0);
    text("Press 'Space Bar' to begin game!", 380, 670);
    
    //Game Screen
  } else if (clear) {
    initialize();
    playerIntro.pause();
    playerGame.rewind();
    playerGame.play();
    background(0);
    image(MapBackground, 600, 350, 1200, 700);
    fill(0);
    rectMode(CENTER);

    //Shadow text for Main Word Problem
    fill(80);
    textFont(gameFont, 36);
    text("The Zombies have attacked and you are on the run for your life!", 188, 45);
    textFont(gameFont, 32);
    text("A traveler has left you a map with 5 safezones. Each location has information to determine", 57, 90);
    text("which can be reached the fastest. Use the formula: Distance = Rate * Time to find the answer.", 52, 135);
    text("Use the number keys to select an answer. Press 'h' for help. Press 'n' for new game.", 133, 680);

    //Main Word Problem Text
    fill(255, 255, 2);
    textFont(gameFont, 36);
    text("The Zombies have attacked and you are on the run for your life!", 185, 45);
    textFont(gameFont, 32);
    text("A traveler has left you a map with 5 safezones. Each location has information to determine", 54, 90);
    text("which can be reached the fastest. Use the formula: Distance = Rate * Time to find the answer.", 49, 135);
    text("Use the number keys to select an answer. Press 'h' for help. Press 'n' for new game.", 130, 680);

    //Shadow Text for Equations
    for (int i = 0; i < eData.length; i++) {
      eData[i].displaytext();
    }

    //Top Row of Rectangles and equations
    imageMode(CENTER);
    image(Circle, 200, 240, 275, 175);
    rect(80, 175, 30, 40);
    image(Prison, 600, 240, 275, 175);
    rect(480, 175, 30, 40);
    image(Ocean, 1000, 240, 275, 175);
    rect(880, 175, 30, 40);
    fill(0);
    textFont(distFont, 34);
    text("1", 72, 185);
    text("2", 472, 185);
    text("3", 872, 185);

    //Bottom Row of Rectangles and equations
    fill(255, 255, 2);
    image(Railroad, 400, 495, 275, 175);
    rect(280, 430, 30, 40);
    image(Amusement, 800, 495, 275, 175);
    rect(680, 430, 30, 40);
    fill(0);
    textFont(distFont, 34);
    text("4", 272, 440);
    text("5", 672, 440);
  }
  //help menu
  if (showHelp) {
    fill(0);
    rect(600, 350, 850, 300);
    fill(255, 0, 0);
    textFont(gameFont, 28);
    text("The problem is asking for the safezone that can be reached the quickest.", 235, 280);
    text("Using the formula Distance = Rate * Time; you will need to solve for Time.", 230, 320);
    text("For example, if the distance is 80 mi. and the rate is 2 mph, then the formula", 210, 360);
    text("will look like Time = Distance/Rate, or T = 80/2, so it will take 40 hours to", 220, 400);
    text("reach this safezone.", 510, 440);
    noLoop();
  }
  //Answer Function
  if (checkAnswer) { 
    //Displays the screen for a correct answer.
    if (userKey == minIndex) {
      minTime = eData[userKey].getTime();
      playerGame.pause();
      playerRight.rewind();
      playerRight.play();
      image(Safe, 600, 350, 900, 600);
      fill(255, 100);
      noStroke();
      rect(600, 115, 870, 125);
      fill(0, 0, 255);
      textFont(distFont, 36);
      text("Congrats you made it! You are a survivor!!", 260, 95);
      text("The best plan is to keep moving, press 'n' to continue!", 185, 150);
    } else { 
      //Displays the screen for a wrong answer.
      playerGame.pause();
      playerWrong.rewind();
      playerWrong.play();
      image(Zombie, 600, 350, 900, 600);
      fill(0, 100);
      noStroke();
      rect(600, 100, 840, 95);
      fill(80);
      textFont(distFont, 36);
      text("AAHHH!! ZOMBIE!! Run the other way!!", 268, 85);
      text("It's important to choose correctly, try again!", 248, 130);
      fill(40,235,0);
      textFont(distFont, 36);
      text("AAHHH!! ZOMBIE!! Run the other way!!", 265, 85);
      text("It's important to choose correctly, try again!", 245, 130);
      noLoop();
    }
    checkAnswer = !checkAnswer;
  }
}

void keyPressed() {
  switch (key) {
  case ' ': //Toggles Title Screen.
    if (start) {
      fill(0);
      noStroke();
    }
    start = !start;
    break;
  case 'n': //Starts new game.
    loop();
    newGame = true;
    initialize();
    break;
  case 'h': //Toggles Help Menu.
    if (showHelp) {
      newGame = false;
      initialize();
      loop();
    }
    showHelp = !showHelp;
    break;
  case '1': //All the keys used to Answer.
  case '2':
  case '3':
  case '4':
  case '5':
    userKey = ((int) key) - 49;
    println(userKey + " = " + key);
    checkAnswer = !checkAnswer;
    break;
  }
}

void initialize() { 
  int [] positions = {
    98, 365, 
    498, 365, 
    898, 365, 
    298, 620, 
    698, 620
  };
  if (newGame) {
    minTime = 100000;
    minIndex = 10;
    for (int i = 0; i < eData.length; i++) {
      eData[i] = new EquationData ((float)random(20, 180), (float)random(0.2, 10.0), positions [i*2], positions [i*2+1]);
    }
    for (int i = 0; i < eData.length; i++) {
      if (eData[i].getTime() < minTime) {
        minTime = eData[i].getTime();
        minIndex = i;
      }
    }
  }
  clear = !clear;
  println(minTime);
  println(minIndex);
}

