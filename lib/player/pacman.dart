import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';

import 'package:pacman/elements/power_up_checker.dart';
import 'package:pacman/game/map.dart';
import 'package:pacman/player/pacman_sprite_sheet.dart';

class Pacman extends SimplePlayer with ObjectCollision {
  Pacman(Vector2 position)
      : super(
          size: Vector2.all(PacmanMap.pacmanSize),
          position: position,
          animation: PacmanSpriteSheet.simpleDirectionAnimation,
          speed: PacmanMap.pacmanSpeed,
          life: 5,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.circle(
            radius: PacmanMap.tileSize * 0.7,
            align: Vector2.all(PacmanMap.tileSize * 0.2),
          ),
        ],
      ),
    );
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    drawDefaultLifeBar(
      canvas,
      borderRadius: BorderRadius.circular(5),
      borderWidth: 2,
    );
  }

  /// Pacman will only receive damage if the [PowerUPChecker.isPoweredUP] is false, if so, he will also be placed at the [PacmanMap.pacmanRespawnPosition].
  @override
  void receiveDamage(
    AttackFromEnum attacker,
    double damage,
    dynamic identify,
  ) {
    super.receiveDamage(attacker, damage, identify);
    if (checkCanReceiveDamage(attacker, damage, identify) && PowerUPChecker().isPoweredUP == false) {
      removeLife(damage);
      position = PacmanMap.pacmanRespawnPosition;
    }
  }

  /// Game Over if the [Pacman.life] is 0.
  @override
  void die() async {
    super.die();
    removeFromParent();
    gameRef.add(
      AnimatedObjectOnce(
        animation: PacmanSpriteSheet.death,
        position: position,
        size: Vector2.all(PacmanMap.tileSize * 1.2),
      ),
    );
  }
}
