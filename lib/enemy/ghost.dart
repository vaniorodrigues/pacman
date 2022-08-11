import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

import 'package:pacman/enemy/common_sprite_sheet.dart';
import 'package:pacman/enemy/ghost_sprite_sheet.dart';
import 'package:pacman/enemy/ghost_controller.dart';
import 'package:pacman/map/map.dart';

class Ghost extends SimpleEnemy
    with
        ObjectCollision,
        JoystickListener,
        MovementByJoystick,
        AutomaticRandomMovement,
        UseStateController<GhostController> {
  Ghost(Vector2 position)
      : super(
          animation: GhostSpriteSheet.simpleDirectionAnimation,
          position: position,
          size: Vector2.all(LabyrinthMap.tileSize * 1.2),
          speed: 120,
          life: 100,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2.all(LabyrinthMap.tileSize * 0.9),
            align: Vector2.all(LabyrinthMap.tileSize * 0.3),
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
        animation: CommonSpriteSheet.smokeExplosion,
        position: position,
        size: Vector2.all(LabyrinthMap.tileSize),
      ),
    );
    removeFromParent();
  }

  void execAttack(double damage) {
    if (gameRef.player != null && gameRef.player?.isDead == true) return;
    simpleAttackMelee(
      size: Vector2.all(width),
      damage: damage,
      interval: 100,
    );
  }

  @override
  void removeLife(double life) {
    showDamage(life);
    super.removeLife(life);
  }

  @override
  void joystickAction(JoystickActionEvent event) {}

  @override
  void moveTo(Vector2 position) {}
}
