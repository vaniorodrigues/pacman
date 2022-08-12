import 'package:pacman/elements/power_up_checker.dart';
import 'package:pacman/enemy/ghost.dart';
import 'package:pacman/player/pacman.dart';
import 'package:pacman/interface/player_score.dart';
import 'package:provider/provider.dart';
import 'package:bonfire/bonfire.dart';
import 'package:pacman/elements/common_sprite_sheet.dart';
import 'package:pacman/game/pacman_map.dart';

/// When in contact with PowerUpFood the player stays invincible for a short period of time [PacmanMap.powerUpDuration].
/// This class sets the [enemy.scaredAnimationOverlay] for all enemy ghosts.
class PowerUpFood extends GameDecoration with Sensor {
  final int points;

  PowerUpFood(Vector2 position, {required this.points})
      : super.withAnimation(
          animation: CommonSpriteSheet.powerUpFoodSprite,
          position: position,
          size: Vector2.all(PacmanMap.tileSize),
        );

  @override
  void onContact(GameComponent component) async {
    if (component is Pacman) {
      removeFromParent();
      context.read<PlayerScore>().addPointsToPlayerScore(points);
      PowerUPChecker().setIsPoweredUp(true);
      for (var enemy in gameRef.visibleEnemies()) {
        if (enemy is Ghost) {
          enemy.scaredAnimationOverlay(enemy);
        }
      }
      await Future.delayed(PacmanMap.powerUpDuration, () => PowerUPChecker().setIsPoweredUp(false));
    }
  }
}
