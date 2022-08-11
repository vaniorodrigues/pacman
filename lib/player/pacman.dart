import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pacman/map/map.dart';
import 'package:pacman/player/pacman_sprite_sheet.dart';

// FIXME: fix the movement of the player to never idle, always move to the last direction

class Pacman extends SimplePlayer with ObjectCollision {
  Pacman(Vector2 position)
      : super(
          size: Vector2.all(LabyrinthMap.tileSize * 1.2),
          position: position,
          animation: PacmanSpriteSheet.simpleDirectionAnimation,
          speed: 150,
          life: 100,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.circle(
            radius: LabyrinthMap.tileSize * 0.4,
            align: Vector2.all(LabyrinthMap.tileSize * 0.2),
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
    gameRef.add(
      AnimatedObjectOnce(
        animation: PacmanSpriteSheet.death,
        position: position,
        size: Vector2.all(LabyrinthMap.tileSize * 1.2),
      ),
    );
    removeFromParent();
  }
}
