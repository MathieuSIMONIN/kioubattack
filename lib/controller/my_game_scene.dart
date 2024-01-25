import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/cupertino.dart';
import 'package:kioub_attack/supporting_files/game_logic.dart';
import '../game_objects/game_text.dart';
import '../supporting_files/constants.dart';

class MyGameScene extends FlameGame with TapDetector
{

  // This variable catch the window's size
  Size gameSize = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;

  // This Method create a Parallax Component that take a parameter "parallax"
  @override
  Future<void>? onLoad() async {
    ParallaxImageData data = ParallaxImageData(backgroundImage);  // Just one image was call from de parallax list (backgroundImage)
    final Parallax parallax = await loadParallax([data]);  // Use a parallax list named "data"
    final backgroundComponent = ParallaxComponent(parallax: parallax);
    add(backgroundComponent);
    return super.onLoad();
  }

  // This Method update a double dt, periodically
  @override
  void update(double dt) {
    super.updateTree(dt);
  }

  // This Method aimed that the canvas (the frame) have to display a new thing
  @override
  void render(Canvas canvas){
    super.render(canvas);
    gameOver ? renderGameOver(canvas) : renderIsPlaying(canvas);   // Ternary operator that check a condition
  }

  renderIsPlaying(Canvas canvas){
    GameText().scoreText(canvas, gameSize);
  }

  renderGameOver(Canvas canvas) {
    GameText().gameOverText(canvas, gameSize);
  }

  void onTapUpInfo(TapUpInfo info){
    super.onTapUp(info);
    gameOver = !gameOver;
  }

}