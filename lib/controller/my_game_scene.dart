import 'dart:math';
import 'dart:ui';
import 'package:flame/flame.dart';
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

class MyGameScene extends FlameGame with TapDetector {
  // This variable catch the window's size
  // Depreciated: Size gameSize = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;
  late Size gameSize; // "late" indicate that the variable will be initiate later
  double reach3ToAdd = 3;

  // This Method create a Parallax Component that take a parameter "parallax"
  @override
  Future<void>? onLoad() async {
    // Just one image was call from de parallax list (backgroundImage)
    ParallaxImageData data = ParallaxImageData(backgroundImage); // , size: gameSize! "!" indicate that gameSize isn't null when onload
    final Parallax parallax = await loadParallax([data]); // Use a parallax list named "data"
    final backgroundComponent = ParallaxComponent(parallax: parallax);
    add(backgroundComponent);
    gameSize = Size(size[0], size[1]);
    return super.onLoad();
  }

  // This Method update a double dt, periodically
  @override
  void update(double dt) {
    super.updateTree(dt);
    if (!gameOver) {
      reach3ToAdd += dt;
      if (reach3ToAdd >= 3) {
        addMonster();
        reach3ToAdd = 0;
      }
      monsters.removeWhere((bestiole) => bestiole.shouldRemove);
      bombs.removeWhere((bing) => bing.shouldRemove);
    }
  }

  addMonster() {
    final index = Random().nextInt(4) + 1; // Randomize monster appearance and avoid monster 0
    final monster = Monster(name: monsterImage(index), screenSize: Size(size[0], size[1])); // Put a monster on the scene, centred
    monsters.add(monster);
    add(monster);
  }

  // This Method aimed that the canvas (the frame) have to display a new thing
  @override
  void render(Canvas canvas) {
    super.render(canvas);
    gameOver ? renderGameOver(canvas) : renderIsPlaying(canvas); // Ternary operator that check a condition
  }

  renderIsPlaying(Canvas canvas) {
    GameText().scoreText(canvas, gameSize);
  }

  renderGameOver(Canvas canvas) {
    GameText().gameOverText(canvas, gameSize);
  }

  @override
  bool onTapUp(TapUpInfo info) {
    super.onTapUp(info);
    print(info);
    print(gameOver);
    if (gameOver) {
      start(this);
    } else {
      double tapPosition = info.eventPosition.global.x;
      Bomb b = (Bomb(tapPosition: tapPosition, screenSize: gameSize));
      bombs.add(b);
      add(b);
    }
    return true;
  }

  void shouldRemove() {
    monsters = [];
  }
}
