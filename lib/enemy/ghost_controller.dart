import 'package:bonfire/bonfire.dart';
import 'package:pacman/main.dart';

import 'ghost.dart';

class GoblinController extends StateController<Goblin> {
  double attack = 20;
  bool _seePlayerToAttackMelee = false;
  bool enableBehaviors = true;

  @override
  void update(double dt, Goblin component) {
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
        radiusVision: tileSize * 10,
      );

      if (!_seePlayerToAttackMelee) {
        component.moveTo(component.position);
      }
    }
  }
}
