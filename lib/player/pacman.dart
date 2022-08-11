import 'package:bonfire/bonfire.dart';
import 'package:pacman/main.dart';
import 'package:pacman/player/pacman_sprite_sheet.dart';

class Pacman extends SimplePlayer with ObjectCollision {
  Pacman(Vector2 position)
      : super(
          size: Vector2.all(tileSize * 0.8),
          position: position,
          animation: PacmanSpriteSheet.simpleDirectionAnimation,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2.all(
              tileSize * 0.6,
            ),
            align: Vector2.all(
              tileSize * 0.2,
            ),
          ),
        ],
      ),
    );
  }
}
