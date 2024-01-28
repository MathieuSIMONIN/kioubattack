import 'package:flame/game.dart';
import 'package:kioub_attack/controller/my_game_scene.dart';

import '../game_objects/bomb.dart';
import '../game_objects/monster.dart';
import 'package:flame/flame.dart';

bool gameOver = true; // At start, the game is on over state
double gameSpeed = 125;
int score = 0;
List<Monster> monsters = [];
List<Bomb> bombs = [];
MyGameScene? gameScene;

stop() {
  gameOver = true;
  // monsters.forEach((monster) => monsters.shouldRemove = true);
  // bombs.forEach((bang) => bang.shouldRemove = true);
  monsters = [];
  bombs = [];
}

// The Method below initiate all game's parameters
start(MyGameScene myGameScene) async {
  gameScene = myGameScene;
  // Use async to await music
  score = 0;
  gameOver = false;
}

shouldRemove() {
  // When this method is called, the monster deasepered
  monsters = [];
}
