import 'package:bonfire/bonfire.dart';
import 'package:pacman/enemy/common_sprite_sheet.dart';
import 'package:pacman/map/map.dart';

class Food extends GameDecoration with Sensor {
  final double points;
  double _lifeDistributed = 0;

  Food(Vector2 position, {required this.points})
      : super.withSprite(
          sprite: CommonSpriteSheet.foodSprite,
          position: position,
          size: Vector2.all(LabyrinthMap.tileSize / 4),
        );

  @override
  void onContact(GameComponent component) {
    if (component is Player) {
      // add provider.read of points and add function to add points.
      // in the layout one provider.watch to rebuild when this is value changes.
      generateValues(
        Duration(seconds: 1),
        onChange: (value) {
          if (_lifeDistributed < points) {
            double newLife = points * value - _lifeDistributed;
            _lifeDistributed += newLife;
            component.addLife(newLife);
          }
        },
      );

      removeFromParent();
    }
  }
}

class PotionLife extends GameDecoration with Sensor {
  final double life;
  double _lifeDistributed = 0;

  PotionLife(Vector2 position, this.life)
      : super.withSprite(
          sprite: CommonSpriteSheet.potionLifeSprite,
          position: position,
          size: Vector2.all(LabyrinthMap.tileSize * 0.5),
        );

  @override
  void onContact(GameComponent collision) {
    if (collision is Player) {
      generateValues(
        Duration(seconds: 1),
        onChange: (value) {
          if (_lifeDistributed < life) {
            double newLife = life * value - _lifeDistributed;
            _lifeDistributed += newLife;
            collision.addLife(newLife);
          }
        },
      );

      removeFromParent();
    }
  }
}
