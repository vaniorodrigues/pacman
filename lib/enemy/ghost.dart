import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

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
  final GhostSpriteSheet ghostSpriteSheet = GhostSpriteSheet('red');
  // SimpleDirectionAnimation _animation = GhostSpriteSheet('red').simpleDirectionAnimation;
  // SimpleDirectionAnimation get animation => _animation;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    drawDefaultLifeBar(
      canvas,
      borderRadius: BorderRadius.circular(5),
      borderWidth: 2,
    );
  }

//overrides the animation when powerUp
  // @override
  void changeAnimation(Ghost component, bool isPoweredUp) async {
    if (isPoweredUp) {
      debugPrint('ghost is RUNNING fot its life up $ghostColor');

      gameRef.add(
        AnimatedFollowerObject(
            animation: GhostSpriteSheet(ghostColor).scared,
            target: this,
            size: Vector2.all(PacmanMap.ghostSize),
            positionFromTarget: Vector2.all(0),
            loopAnimation: true),
      );
    } else {
      debugPrint('ghost is hunting up $ghostColor');
      // component.animation = GhostSpriteSheet(ghostColor).simpleDirectionAnimation;
    }
  }

  // @override
  void onReceiveDamage(double damage) {
    debugPrint('Ghost receive damage: $damage');
    // component.animation = GhostSpriteSheet(ghostColor).powerUpDirectionAnimation;
    position = PacmanMap.ghostRespawnPosition;
  }

  // @override
  // void die() async {
  //   super.die();
  //   context.read<PlayerScore>().removeLifeFromPlayer();
  //   gameRef.add(
  //     AnimatedObjectOnce(
  //       animation: GhostSpriteSheet(ghostColor).death,
  //     ),
  //   );
  // }
// }

  @override
  void die() {
    super.die();
    removeFromParent();
  }

  void execAttack(double damage) {
    // debugPrint('Executing attack');
    if (gameRef.player != null && gameRef.player?.isDead == true) return;
    if (context.read<PlayerScore>().isPoweredUP == true) {
      position = PacmanMap.ghostRespawnPosition;
    } else {
      simpleAttackMelee(
        size: Vector2.all(width),
        damage: damage,
        interval: 1,
      );
    }
  }

  @override
  void removeLife(double life) {
    showDamage(life);
    super.removeLife(life);
  }

  @override
  bool checkCanReceiveDamage(AttackFromEnum attacker, double damage, from) {
    bool shouldReceive = super.checkCanReceiveDamage(attacker, damage, from) && context.read<PlayerScore>().isPoweredUP;
    if (shouldReceive) {
      position = PacmanMap.pacmanSpawnPosition;
      context.read<PlayerScore>().addPointsToPlayerScore(400);
    }
    return shouldReceive;
  }

  @override
  void joystickAction(JoystickActionEvent event) {}

  @override
  void moveTo(Vector2 position) {}
}
