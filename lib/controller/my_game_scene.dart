import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/cupertino.dart';
import 'package:kioub_attack/game_objects/monster.dart';
import 'package:kioub_attack/supporting_files/game_logic.dart';
import '../game_objects/bomb.dart';
import '../game_objects/game_text.dart';
import '../supporting_files/constants.dart';

class MyGameScene extends FlameGame with TapDetector
{

  // This variable catch the window's size
  Size gameSize = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;
  double reach3ToAdd = 3;  //

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
    if(!gameOver) {
      reach3ToAdd += dt;
        if(reach3ToAdd >= 3) {
          addMonster();
          reach3ToAdd = 0;
        }
        monsters.removeWhere((bestiole) => bestiole.shouldRemove);
        bombs.removeWhere((bing) => bing.shouldRemove);
    }
  }

  addMonster() {
    final index = Random().nextInt(4) + 1;  // Randomize monster appearance and avoid monster 0
    final monster = Monster(name: monsterImage(index), screenSize: gameSize);  // Put a monster on the scene, centred
    monsters.add(monster);
    add(monster);
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
    if(gameOver){
      start();
    } else {
      double tapPosition = info.eventPosition.global.x - 12.5;
      Bomb b = (Bomb(tapPosition: tapPosition, screenSize: gameSize));
      bombs.add(b);
      add(b);
    }
    gameOver = !gameOver;
  }

}