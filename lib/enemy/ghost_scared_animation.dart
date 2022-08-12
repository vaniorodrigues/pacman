import 'dart:async';

import 'package:bonfire/bonfire.dart';
import 'package:bonfire/util/assets_loader.dart';
import 'package:pacman/game/pacman_map.dart';

/// The scared animation of the ghost, it overlays the basic animation for a fixed time defined by [PacmanMap.powerUpDuration].
class GhostScaredAnimationOverlay extends AnimatedFollowerObject {
  GhostScaredAnimationOverlay({
    required FutureOr<SpriteAnimation> animation,
    required GameComponent target,
    required Vector2 size,
    Vector2? positionFromTarget,
    this.loop = false,
  }) : super(
            animation: animation,
            target: target,
            size: size,
            positionFromTarget: positionFromTarget,
            loopAnimation: loop) {
    this.size = size;
    setupFollower(target, followerPositionFromTarget: positionFromTarget);
    loader?.add(AssetToLoad(animation, (value) => this.animation = value));
  }

  final bool loop;
  @override
  Future<void> update(double dt) async {
    super.update(dt);
    if (loop) {
      await Future.delayed(PacmanMap.powerUpDuration, () {
        removeFromParent();
      });
    }
  }
}
