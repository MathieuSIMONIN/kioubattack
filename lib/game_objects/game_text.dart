import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kioub_attack/supporting_files/game_logic.dart';

import '../supporting_files/constants.dart';

class GameText {
  TextStyle style({required Color color, required double size}) => TextStyle(color: color, fontSize: size, fontFamily: fontName);
  TextPaint scoreStyle() => TextPaint(style: style(color: Colors.white, size: 30));
  TextPaint gameOverStyle() => TextPaint(style: style(color: Colors.red, size: 48));

  scoreText(Canvas canvas, Size size){
    scoreStyle().render(canvas, "Score: $score", Vector2(size.width/3, 30));
  }

  gameOverText(Canvas canvas, Size size){
    gameOverStyle().render(canvas,
            "Game Over!\n"
            "Score: $score\n"
            "PLAY!",
        Vector2(24, size.height/2));
  }
}