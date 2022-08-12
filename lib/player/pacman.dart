import 'dart:io';

import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:pacman/elements/power_up_checker.dart';

import 'package:pacman/game/map.dart';
import 'package:pacman/player/pacman_sprite_sheet.dart';
import 'package:pacman/player/player_score.dart';
import 'package:provider/provider.dart';

class Pacman extends SimplePlayer with ObjectCollision {
  Pacman(Vector2 position)
      : super(
          size: Vector2.all(PacmanMap.pacmanSize),
          position: position,
          animation: PacmanSpriteSheet.simpleDirectionAnimation,
          speed: PacmanMap.pacmanSpeed,
          life: 3,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.circle(
            radius: PacmanMap.tileSize * 0.75,
            align: Vector2.all(PacmanMap.tileSize * 0.1),
          ),
        ],
      ),
    );
  }

  // bool isPoweredUP = false;
  // void setpowerUp(bool value) {
  //   isPoweredUP = value;
  // }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    drawDefaultLifeBar(
      canvas,
      borderRadius: BorderRadius.circular(5),
      borderWidth: 2,
    );
  }

  void onReceiveDamage(double damage) {
    debugPrint('Pacman receive damage: $damage');
    position = PacmanMap.pacmanSpawnPosition;
  }

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

  @override
  void receiveDamage(
    AttackFromEnum attacker,
    double damage,
    dynamic identify,
  ) {
    super.receiveDamage(attacker, damage, identify);
    if (checkCanReceiveDamage(attacker, damage, identify) && PowerUPChecker().isPoweredUP == false) {
      // sleep(Duration(milliseconds: 3000));
      removeLife(damage);
      position = PacmanMap.pacmanSpawnPosition;
    }
  }
}
