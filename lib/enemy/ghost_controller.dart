import 'package:bonfire/bonfire.dart';
import 'package:pacman/game/pacman_map.dart';

import 'ghost.dart';

class GhostController extends StateController<Ghost> {
  double attackDamage = 1;
  bool _seePlayerToAttackMelee = false;
  bool enableBehaviors = true;

  @override
  void update(double dt, Ghost component) async {
    if (!enableBehaviors) return;

    if (!gameRef.sceneBuilderStatus.isRunning) {
      _seePlayerToAttackMelee = false;

      component.seeAndMoveToPlayer(
        closePlayer: (player) {
          component.execAttack(attackDamage);
        },
        observed: () {
          _seePlayerToAttackMelee = true;
        },
        radiusVision: PacmanMap.tileSize * 1,
      );

      if (!_seePlayerToAttackMelee) {
        await Future.delayed(Duration(seconds: 2), () {
          component.runRandomMovement(
            dt,
            speed: component.speed,
            maxDistance: (PacmanMap.tileSize * 100).toInt(),
            timeKeepStopped: 000,
          );
        });
      }
    }
  }

  // Moves all ghots to the respawn position everytime the pacman loses a life.
  void moveGhotsToStartPosition() {
    int i = 0;
    for (var enemy in gameRef.visibleEnemies()) {
      if (enemy is Ghost && enemy.life > 0) {
        enemy.position = PacmanMap.ghostRespawnPositions[i];
        i++;
      }
    }
  }
}
