import 'package:bonfire/bonfire.dart';

import 'package:flutter/material.dart';
import 'package:pacman/enemy/common_sprite_sheet.dart';
import 'package:pacman/enemy/ghost_sprite_sheet.dart';
import 'package:pacman/enemy/ghost_controller.dart';
import 'package:pacman/main.dart';

class Goblin extends SimpleEnemy
    with
        ObjectCollision,
        JoystickListener,
        MovementByJoystick,
        AutomaticRandomMovement,
        UseStateController<GoblinController> {
  Goblin(Vector2 position)
      : super(
          animation: RedGhostSpriteSheet.simpleDirectionAnimation,
          // animation: EnemySpriteSheet.simpleDirectionAnimation,
          position: position,
          size: Vector2.all(tileSize * 0.8),
          speed: tileSize * 1.6,
          life: 100,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(
              tileSize * 0.6,
              tileSize * 0.6,
            ),
            align: Vector2(
              tileSize * 0.2,
              tileSize * 0.2,
            ),
          ),
        ],
      ),
    );
  }

  // @override
  // void render(Canvas canvas) {
  //   super.render(canvas);
  //   this.drawDefaultLifeBar(
  //     canvas,
  //     borderRadius: BorderRadius.circular(5),
  //     borderWidth: 2,
  //   );
  // }

  @override
  void die() {
    super.die();
    gameRef.add(
      AnimatedObjectOnce(
        animation: CommonSpriteSheet.smokeExplosion,
        position: position,
        size: Vector2.all(tileSize),
      ),
    );
    removeFromParent();
  }

  void execAttack(double damage) {
    if (gameRef.player != null && gameRef.player?.isDead == true) return;
    simpleAttackMelee(
      size: Vector2.all(width),
      damage: damage / 2,
      interval: 400,
      sizePush: tileSize / 2,
      animationDown: CommonSpriteSheet.blackAttackEffectBottom,
      animationLeft: CommonSpriteSheet.blackAttackEffectLeft,
      animationRight: CommonSpriteSheet.blackAttackEffectRight,
      animationUp: CommonSpriteSheet.blackAttackEffectTop,
    );
  }

  @override
  void removeLife(double life) {
    showDamage(
      life,
    );
    super.removeLife(life);
  }

  @override
  void joystickAction(JoystickActionEvent event) {}

  @override
  void moveTo(Vector2 position) {}
}
