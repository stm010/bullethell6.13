class Starfighter extends GameObject {

  int cooldown, threshold;

  //float x, y, vx, vy, size;
  //color c;
  //int lives;

  Starfighter() {
    super(width/2, height/2, 0, 0, 40, blue3, 50);
    // (float x, float y, float vx, float vy, float size, color c, int lives)

    threshold = 5; //bullet cooldown
    cooldown = threshold;

    //x = width/2;
    //y = height/2;
    //vx = 0;
    //vy = 0;
    //size = 40;
    //c = #FF0000;
    //lives = 3;
  }

  void act() {
    super.act();

    //color lives indicator
    if (lives==5) {
      c = blue2;
    }
    if (lives==2) {
      c = blue1;
    }

    //managing guns
    cooldown++;
    if (space && cooldown >= threshold) {


      //objects.add(new Bullet());

      //classic
      objects.add (new Bullet (x, y, 0, -10)); //up

      //objects.add (new Bullet (x, y, 0, 10)); //down
      //objects.add (new Bullet (x, y, 10, 0)); //right
      //objects.add (new Bullet (x, y, -10, 10));

      cooldown = 0;
    }

    //controls
    if (up) vy = -5;
    if (down) vy = 5;
    if (left) vx = -5;
    if (right) vx = 5;
    if (!up && !down) vy = vy * 0.9;
    if (!left && !right) vx = vx * 0.9;

    //x += vx;
    //y += vy;
    //collisions
    int i = 0;
    while (i < objects.size()) {
      GameObject obj = objects.get(i);

      if (obj instanceof EnemyBullet || obj instanceof EnemyBullet2) { //instanceof checks class
        if (collidingWith (obj)) {
          lives--;
          obj.lives=0;

          if (lives<1) {
            // starfighter particles
            objects.add (new StarfighterParticles (x, y, 0, -10)); //up
            objects.add (new StarfighterParticles (x, y, 0, 10)); //down
            objects.add (new StarfighterParticles (x, y, 10, 0)); //right
            objects.add (new StarfighterParticles (x, y, -10, 10));
            objects.add (new StarfighterParticles (x, y, 0, -15)); //up
            objects.add (new StarfighterParticles (x, y, 0, 15)); //down
            objects.add (new StarfighterParticles (x, y, 15, 0)); //right
            objects.add (new StarfighterParticles (x, y, -15, 15));
            objects.add (new StarfighterParticles (x, y, 0, -5 )); //up
            objects.add (new StarfighterParticles (x, y, 0, 5)); //down
            objects.add (new StarfighterParticles (x, y, 5, 0)); //right
            objects.add (new StarfighterParticles (x, y, -5, 5));

            timer = 730;
            if (timer == 0) {

              mode = GAMEOVER;
            }
          }
        }
      }
      i++;
    }

    while (i < objects.size()) {
      GameObject obj = objects.get(i);

      if (obj instanceof PowerUp1) { //instanceof checks class
        if (collidingWith (obj)) {
          //lives--;
          obj.lives=0;
          vy = vy + 10;
          vx = vx + 10;


        }
      }
      i++;
    }

  
   


    //offscreen tp
    if (x > width) {
      x = 0 + 1;
    }
    if (x < 0) {
      x = width + 1;
    }
    if (y > height) {
      y = 0 + 1;
    }
    if (y < 0) {
      y = height - 1;
    }
  }

  //void show () {
  //  fill (c);
  //  square (x, y, size);
  //}
}
