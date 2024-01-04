import 'package:flame/components.dart';
import 'package:flame/game.dart';
import '../supporting_files/constants.dart';

class MyGameScene extends FlameGame
{
  // This Method create a Parallax Component that take a parameter "parallax"
  @override
  Future<void>? onLoad() async {
    ParallaxImageData data = ParallaxImageData(backgroundImage);  // Just one image was call from de parallax list (backgroundImage)
    final Parallax parallax = await loadParallax([data]);  // Use a parallax list named "data"
    final backgroundComponent = ParallaxComponent(parallax: parallax);
    add(backgroundComponent);
    return super.onLoad();
  }
}