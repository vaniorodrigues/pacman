import 'package:bonfire/bonfire.dart';
import 'package:pacman/game/map.dart';

import 'ghost.dart';

class GhostController extends StateController<Ghost> {
  double attack = 1;
  bool _seePlayerToAttackMelee = false;
  bool enableBehaviors = true;

  @override
  void update(double dt, Ghost component) async {
    if (!enableBehaviors) return;

    if (!gameRef.sceneBuilderStatus.isRunning) {
      _seePlayerToAttackMelee = false;

      component.seeAndMoveToPlayer(
        closePlayer: (player) {
          component.execAttack(attack);
        },
        observed: () {
          _seePlayerToAttackMelee = true;
        },
        radiusVision: PacmanMap.tileSize * 0,
        // FIXME: This is a workaround to avoid the ghost to attack the player when the player is powered up.
      );

      if (!_seePlayerToAttackMelee) {
        await Future.delayed(Duration(seconds: 3), () {
          component.runRandomMovement(
            dt,
            speed: component.speed / 2,
            maxDistance: (PacmanMap.tileSize * 100).toInt(),
            timeKeepStopped: 000,
          );
        });
      }
    }
  }
}
