import 'package:bonfire/bonfire.dart';
import 'package:pacman/game/map.dart';

import 'ghost.dart';

class GhostController extends StateController<Ghost> {
  double attack = 100;
  bool _seePlayerToAttackMelee = false;
  bool enableBehaviors = true;

  @override
  void update(double dt, Ghost component) {
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
        radiusVision: LabyrinthMap.tileSize * 8,
      );

      if (!_seePlayerToAttackMelee) {
        component.runRandomMovement(
          dt,
          speed: component.speed / 2,
          maxDistance: (LabyrinthMap.tileSize * 40).toInt(),
          timeKeepStopped: 0000,
        );
      }
    }
  }
}
