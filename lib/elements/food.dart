import 'package:provider/provider.dart';
import 'package:bonfire/bonfire.dart';
import 'package:pacman/elements/common_sprite_sheet.dart';
import 'package:pacman/game/pacman_map.dart';
import 'package:pacman/player/player_score.dart';

class Food extends GameDecoration with Sensor {
  final int points;

  Food(Vector2 position, {required this.points})
      : super.withSprite(
          sprite: CommonSpriteSheet.foodSprite,
          position: position,
          size: Vector2.all(PacmanMap.tileSize / 4),
        );

  @override
  void onContact(GameComponent component) {
    if (component is Player) {
      context.read<PlayerScore>().addPointsToPlayerScore(points);
      removeFromParent();
    }
  }
}
