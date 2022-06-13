void game () {
  if (timer==600) {
    mode = GAMEOVER;
  }
  //background (0);

  //star streaks
  fill (10, 90); //transparency
  rect (width/2, height/2, width, height);
  addObjects();
  gameEngine();
  debug ();

  //clears explosions
  text (timer, 10, 60);
  timer = timer - 1;
  if (timer<-1) {
    timer = 200;
  }

  //  if (Starfighter (lives==0)){;
  //  timer = 200;
  //  }
}



void addObjects() {
  objects.add(0, new Star ());

  if (frameCount % 30 == 0) objects.add(new Enemy());
  if (frameCount % 30 == 0) objects.add(new Enemy2());
  if (frameCount % 300 == 0) objects.add(new Enemy3());
}

void debug () {
  text (frameRate, 10, 20);
  text (objects.size(), 10, 40);
}

void gameEngine() {
  int i = 0;
  while ( i < objects.size()) {
    GameObject s = objects.get(i);
    s.act();
    s.show();
    if (s.lives == 0) {
      objects.remove(i);
    } else {
      i ++;
    }
  }
}

void gameClicks() {
  mode = PAUSE;
}
