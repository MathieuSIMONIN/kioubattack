import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:kioub_attack/controller/my_game_scene.dart';

// Entry point of the application
void main() {
  Flame.device.fullScreen(); // Allow full screen at game start
  runApp(
      GameWidget(
        game: MyGameScene()
    )
  );
}