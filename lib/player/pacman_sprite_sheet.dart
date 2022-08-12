import 'package:bonfire/bonfire.dart';

/// All animations of the player.
class PacmanSpriteSheet {
  static const double stepTimeMovement = 0.1;

  static get idleRight => SpriteAnimation.load(
        'player/pacman.png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: stepTimeMovement,
          textureSize: Vector2(16, 16),
        ),
      );
  static get runRight => SpriteAnimation.load(
        'player/pacman.png',
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: stepTimeMovement,
          textureSize: Vector2(16, 16),
        ),
      );

  static get idleLeft => SpriteAnimation.load(
        'player/pacman.png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: stepTimeMovement,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(0, 1 * 16),
        ),
      );
  static get runLeft => SpriteAnimation.load(
        'player/pacman.png',
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: stepTimeMovement,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(0, 1 * 16),
        ),
      );

  static get idleUp => SpriteAnimation.load(
        'player/pacman.png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: stepTimeMovement,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(0, 2 * 16),
        ),
      );

  static get runUp => SpriteAnimation.load(
        'player/pacman.png',
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: stepTimeMovement,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(0, 2 * 16),
        ),
      );

  static get idleDown => SpriteAnimation.load(
        'player/pacman.png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: stepTimeMovement,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(0, 3 * 16),
        ),
      );

  static get runDown => SpriteAnimation.load(
        'player/pacman.png',
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: stepTimeMovement,
          textureSize: Vector2(16, 16),
          texturePosition: Vector2(0, 3 * 16),
        ),
      );

  static get death => SpriteAnimation.load(
        'player/pacman_death.png',
        SpriteAnimationData.sequenced(
          amount: 12,
          stepTime: 0.2,
          textureSize: Vector2(16, 16),
        ),
      );

  static SimpleDirectionAnimation get simpleDirectionAnimation => SimpleDirectionAnimation(
        idleRight: idleRight,
        runRight: runRight,
        idleLeft: idleLeft,
        runLeft: runLeft,
        idleUp: idleUp,
        runUp: runUp,
        idleDown: idleDown,
        runDown: runDown,
        others: {
          'death': death,
        },
      );
}
