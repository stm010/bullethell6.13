class Bullet extends GameObject {

  Bullet (float x, float y, float vx, float vy) { //allows bullet configuration
    super (x, y, vx, vy, 10, blue3, 1);
    if (y > height) lives = 0;
  }

  //Bullet () {

  //super(player1.x, player1.y, 0, -10, 10, blue3, 1);

  // if (y > height) lives = 0;


  void act () {
    super.act();
    if (offScreen()) lives = 0;
  }
}
