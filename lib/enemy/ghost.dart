import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pacman/elements/power_up_checker.dart';
import 'package:pacman/enemy/ghost_scared_animation.dart';

import 'package:pacman/enemy/ghost_sprite_sheet.dart';
import 'package:pacman/enemy/ghost_controller.dart';
import 'package:pacman/game/map.dart';
import 'package:provider/provider.dart';

import '../player/player_score.dart';

class Ghost extends SimpleEnemy
    with
        ObjectCollision,
        JoystickListener,
        MovementByJoystick,
        AutomaticRandomMovement,
        UseStateController<GhostController> {
  Ghost(Vector2 position, {required this.ghostColor})
      : super(
          animation: GhostSpriteSheet(ghostColor).simpleDirectionAnimation,
          position: position,
          size: Vector2.all(PacmanMap.ghostSize),
          speed: 120,
          life: 100,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2.all(PacmanMap.ghostSize * 0.8),
            align: Vector2.all(PacmanMap.tileSize * 0.2),
          ),
        ],
      ),
    );
  }

  final String ghostColor;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    drawDefaultLifeBar(
      canvas,
      borderRadius: BorderRadius.circular(5),
      borderWidth: 2,
    );
  }

  void scaredAnimation(Ghost component) async {
    gameRef.add(
      GhostScaredAnimationOverlay(
        animation: GhostSpriteSheet(ghostColor).scared,
        target: this,
        size: Vector2.all(PacmanMap.ghostSize),
        positionFromTarget: Vector2.all(0),
        loop: true,
      ),
    );
    // anim.loopAnimation = true;
  }

  @override
  void die() {
    super.die();
    removeFromParent();
  }

  /// The execAttack defines who will take the damage from the attack (pacman or ghost), the decision is made based on the [PowerUPChecker.isPoweredUP].
  /// If the [PowerUPChecker.isPoweredUP] is true, the ghost will take the damage from the pacman, otherwise the pacman will take the damage from the ghosts.
  void execAttack(double damage) {
    debugPrint('GHOST TRYING TO Executing attack');
    if (gameRef.player != null && gameRef.player?.isDead == true) return;
    if (PowerUPChecker().isPoweredUP == true) {
      debugPrint('GHOST moved to ghostRespawnPosition ');
      position = PacmanMap.ghostRespawnPositions[1];
    } else {
      debugPrint('GHOST ATTACKED SUCESSFULLY');
      simpleAttackMelee(size: Vector2.all(width), damage: damage, interval: 1);
      controller.moveGhots();
    }
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
