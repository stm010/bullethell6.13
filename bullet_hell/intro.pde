void intro () {
  background (0);
  text ("BULLET HELL", 100, 100);
  
    objects = new ArrayList < GameObject > ();
  player1 = new Starfighter();
  objects.add(player1);
}

void introClicks() {
  mode = GAME;
}
