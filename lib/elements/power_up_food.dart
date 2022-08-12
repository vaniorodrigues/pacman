import 'package:flutter/material.dart';
import 'package:pacman/enemy/ghost.dart';
import 'package:pacman/enemy/ghost_sprite_sheet.dart';
import 'package:pacman/player/pacman.dart';
import 'package:pacman/player/player_score.dart';
import 'package:provider/provider.dart';
import 'package:bonfire/bonfire.dart';
import 'package:pacman/elements/common_sprite_sheet.dart';
import 'package:pacman/game/map.dart';

class PowerUpFood extends GameDecoration with Sensor {
  final int points;

  PowerUpFood(Vector2 position, {required this.points})
      : super.withSprite(
          sprite: CommonSpriteSheet.foodSprite,
          position: position,
          size: Vector2.all(PacmanMap.tileSize / 1),
        );

  @override
  void onContact(GameComponent component) async {
    if (component is Pacman) {
      context.read<PlayerScore>().addPointsToPlayerScore(points);
      // removeFromParent();

      // change ghosts animation to be scared
      final enemies = gameRef.visibleEnemies();
      for (var enemy in enemies) {
        if (enemy is Ghost) {
          enemy.changeAnimation(enemy, true);
        }
      }

      await Future.delayed(Duration(seconds: 10), () {
        for (var enemy in enemies) {
          if (enemy is Ghost) {
            debugPrint('IM TRYING TO FIZ THE GHOST');
            enemy.changeAnimation(enemy, false);
          }
        }
      });
    }
  }
}
