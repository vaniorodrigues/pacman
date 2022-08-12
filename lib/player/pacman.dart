import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';

import 'package:pacman/game/map.dart';
import 'package:pacman/player/pacman_sprite_sheet.dart';
import 'package:pacman/player/player_score.dart';
import 'package:provider/provider.dart';

// FIXME: fix the movement of the player to never idle, always move to the last direction

// Add powerUp to the player when eating powerUpFood

class Pacman extends SimplePlayer with ObjectCollision {
  Pacman(Vector2 position)
      : super(
          size: Vector2.all(PacmanMap.pacmanSize),
          position: position,
          animation: PacmanSpriteSheet.simpleDirectionAnimation,
          speed: PacmanMap.pacmanSpeed,
          life: 100,
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

  bool isPowerUP = false;
  void setpowerUp(bool value) {
    isPowerUP = value;
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

  void onReceiveDamage(double damage) {
    debugPrint('Pacman receive damage: $damage');
    position = PacmanMap.pacmanSpawnPosition;
  }

  @override
  void die() async {
    super.die();
    context.read<PlayerScore>().removeLifeFromPlayer();
    gameRef.add(
      AnimatedObjectOnce(
        animation: PacmanSpriteSheet.death,
        position: position,
        size: Vector2.all(PacmanMap.tileSize * 1.2),
      ),
    );
    if (context.read<PlayerScore>().playerLives <= 0) {
      removeFromParent();
    }
    await Future.delayed(Duration(milliseconds: 2400), () {
      position = PacmanMap.pacmanSpawnPosition;
    });
  }

  /// This method is used to check if this component can receive damage from any attacker.
  /// It will be called everytime a [receiveDamage] is called, before it runs [removeLife]
  @override
  bool checkCanReceiveDamage(AttackFromEnum attacker, double damage, from, {bool isPowerUP = false}) {
    bool shouldReceive =
        super.checkCanReceiveDamage(attacker, damage, from) && !context.read<PlayerScore>().isPoweredUP;
    if (shouldReceive) {
      position = PacmanMap.pacmanSpawnPosition;
      context.read<PlayerScore>().removeLifeFromPlayer();
    }
    return shouldReceive;
  }
}
