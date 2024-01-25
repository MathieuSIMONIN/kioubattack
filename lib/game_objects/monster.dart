import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:kioub_attack/supporting_files/game_logic.dart';

class Monster extends SpriteComponent
{
  String name;
  Size screenSize;

  Monster({required this.name, required this.screenSize});
  double get myX => Random().nextInt(screenSize.width.toInt()).toDouble();

  @override
  Future<void>? onLoad() async
  {
      sprite = await Sprite.load(name);
      size = Vector2.all(25);
      return super.onLoad();
  }

  @override
  void onGameResize(Vector2 gameSize) {
    super.onGameResize(size);
    // x = screenSize.width / 2 - 12.5;   // Screen center position
    x = myX;
    y = 40;
  }

  @override
  void update(double dt) {
    super.update(dt);
    if(!gameOver){
      y += (gameSpeed + score) * dt/3;
      if(y >= screenSize.height - 50) {   // If the monster is almost at bottom screen
        shouldRemove = true;
        stop();  // Allow to reset all sprites in the game
      }
    }
  }

}