import 'package:bonfire/bonfire.dart';

class GhostSpriteSheet {
  final String ghostColor;

  GhostSpriteSheet(this.ghostColor);

  Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
        "ghost/$ghostColor.png",
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(0, 0),
        ),
      );

  Future<SpriteAnimation> get idleLeft => SpriteAnimation.load(
        "ghost/$ghostColor.png",
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(2 * 16, 0),
        ),
      );

  Future<SpriteAnimation> get idleUp => SpriteAnimation.load(
        "ghost/$ghostColor.png",
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(4 * 16, 0),
        ),
      );

  Future<SpriteAnimation> get idleDown => SpriteAnimation.load(
        "ghost/$ghostColor.png",
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(6 * 16, 0),
        ),
      );

  Future<SpriteAnimation> get runRight => SpriteAnimation.load(
        "ghost/$ghostColor.png",
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(0, 0),
        ),
      );

  Future<SpriteAnimation> get runLeft => SpriteAnimation.load(
        "ghost/$ghostColor.png",
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(2 * 16, 0),
        ),
      );

  Future<SpriteAnimation> get runUp => SpriteAnimation.load(
        "ghost/$ghostColor.png",
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(4 * 16, 0),
        ),
      );

  Future<SpriteAnimation> get runDown => SpriteAnimation.load(
        "ghost/$ghostColor.png",
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(6 * 16, 0),
        ),
      );

  SimpleDirectionAnimation get simpleDirectionAnimation => SimpleDirectionAnimation(
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
