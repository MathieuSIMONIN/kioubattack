import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/components.dart';
import 'package:kioub_attack/supporting_files/constants.dart';
import 'package:kioub_attack/supporting_files/game_logic.dart';

class Bomb extends SpriteComponent
{

  Size screenSize;
  double tapPosition;

  Bomb({required this.tapPosition, required this.screenSize});

  @override
  Future<void>? onLoad() async {
    sprite = await Sprite.load(bombImage);
    size = Vector2.all(25);
    return super.onLoad();
  }

  @override
  void onGameResize(Vector2 gameSize){
    super.onGameResize(gameSize);
    x = tapPosition;
    y = screenSize.height - 50;
  }

  @override
  void update(double dt){
    super.update(dt);
    y -= dt * gameSpeed;
    if(y < 0){
      shouldRemove = true;
    }
  }

  @override
  void render(Canvas canvas){
    super.render(canvas);
  }
}