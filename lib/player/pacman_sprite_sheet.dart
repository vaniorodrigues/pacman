import 'package:bonfire/bonfire.dart';

class PacmanSpriteSheet {
  static get idleRight => SpriteAnimation.load(
        'player/pac_run_right.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );
  static get idleLeft => SpriteAnimation.load(
        'player/pac_run_right.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );
  static get runRight => SpriteAnimation.load(
        'player/pac_run_right.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );
  static get runLeft => SpriteAnimation.load(
        'player/pac_run_right.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static SimpleDirectionAnimation get simpleDirectionAnimation => SimpleDirectionAnimation(
        idleRight: idleRight,
        runRight: runRight,
      );
}
