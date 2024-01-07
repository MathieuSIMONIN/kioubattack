import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../supporting_files/constants.dart';

class GameText {
  TextStyle style({required Color color, required double size}) => TextStyle(color: color, fontSize: size, fontFamily: fontName);
  TextPaint score() => TextPaint(style: style(color: Colors.white, size: 30));
  TextPaint gameOver() => TextPaint(style: style(color: Colors.red, size: 48));

  scoreText(Canvas canvas, Size size){
    score().render(canvas, "Score: $score", Vector2(size.width/3, 30));
  }

  gameOverText(Canvas canvas, Size size){
    gameOver().render(canvas,
        "Game Over!\n "
            "Score: $score \n"
            "Tapez pour\n "
            "jouer à nouveau !", 
        Vector2(size.width/4, size.height/3));
  }
}