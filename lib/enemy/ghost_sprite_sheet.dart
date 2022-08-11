import 'package:bonfire/bonfire.dart';

class RedGhostSpriteSheet {
  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
        "ghost/red_right.png",
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> get idleLeft => SpriteAnimation.load(
        "ghost/red_left.png",
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> get idleUp => SpriteAnimation.load(
        "ghost/red_up.png",
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> get idleDown => SpriteAnimation.load(
        "ghost/red_down.png",
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
        "ghost/red_right.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> get runLeft => SpriteAnimation.load(
        "ghost/red_left.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> get runUp => SpriteAnimation.load(
        "ghost/red_up.png",
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> get runDown => SpriteAnimation.load(
        "ghost/red_down.png",
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static SimpleDirectionAnimation get simpleDirectionAnimation => SimpleDirectionAnimation(
        idleRight: idleRight,
        idleLeft: idleLeft,
        idleUp: idleUp,
        idleDown: idleDown,
        runRight: runRight,
        runLeft: runLeft,
        runUp: runUp,
        runDown: runDown,
      );
}
