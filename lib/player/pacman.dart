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
          size: Vector2.all(LabyrinthMap.pacmanSize),
          position: position,
          animation: PacmanSpriteSheet.simpleDirectionAnimation,
          speed: LabyrinthMap.pacmanSpeed,
          life: 100,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.circle(
            radius: LabyrinthMap.tileSize * 0.75,
            align: Vector2.all(LabyrinthMap.tileSize * 0.1),
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

  @override
  void die() {
    super.die();
    context.read<PlayerScore>().removeLifeFromPlayer();
    gameRef.add(
      AnimatedObjectOnce(
        animation: PacmanSpriteSheet.death,
        position: position,
        size: Vector2.all(LabyrinthMap.tileSize * 1.2),
      ),
    );
    if (context.read<PlayerScore>().playerLives <= 0) {
      removeFromParent();
    }
    Future.delayed(Duration(milliseconds: 100), () {
      position = LabyrinthMap.pacmanSpawnPosition;
      // gameRef.add(Pacman(position));
    });
  }
}
