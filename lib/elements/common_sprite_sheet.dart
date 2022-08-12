import 'package:bonfire/bonfire.dart';

class CommonSpriteSheet {
  static Future<Sprite> get foodSprite => Sprite.load(
        'food.png',
        srcSize: Vector2.all(1),
      );

  static Future<SpriteAnimation> get powerUpFoodSprite => SpriteAnimation.load(
        "powerUp.png",
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.25,
          textureSize: Vector2(8, 8),
        ),
      );
}
