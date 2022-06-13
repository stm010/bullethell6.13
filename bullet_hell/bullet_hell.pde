//imports


//palette

color black = #03071e;

color blue1 = #023047;
color blue2 = #219ebc;
color blue3 = #8ecae6;
color orange = #fb8500;
color yellow = #ffb703;
color red = #e63946;

//framework
final int INTRO = 1;
final int GAME = 2;
final int GAMEOVER = 3;
final int PAUSE = 4;
int mode = GAME;

int timer;

boolean up, down, left, right, space;

ArrayList <GameObject> objects;
Starfighter player1;

void setup () {

  size (800, 800);
  mode = INTRO;
  rectMode (CENTER);
  objects = new ArrayList < GameObject > ();
  player1 = new Starfighter();
  objects.add(player1);
  
  timer = 200;
}

void draw () {

  if (mode == INTRO) {
    intro ();
  } else if (mode == GAME) {
    game ();
  } else if (mode == GAMEOVER) {
    gameover ();
  } else if (mode == PAUSE) {
    pause ();
  } else {
    println ("?");
  }
}
