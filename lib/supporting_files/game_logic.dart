bool gameOver = true; // At start, the game is over
double gameSpeed = 125;
int score =0;

stop() {
  gameOver = true;
}

// The Method below initiate all game's parameters
start() async {  // Use async to wait music
  score = 0;
  gameOver = false;
}