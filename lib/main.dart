import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:kioub_attack/controller/my_game_scene.dart';

void main() {
  Flame.device.fullScreen();
  runApp(
      GameWidget(
        game: MyGameScene()
    )
  );
}