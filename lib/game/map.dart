import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:pacman/elements/food.dart';
import 'package:pacman/enemy/ghost.dart';

class LabyrinthMap {
  static double tileSize = 16;
  static double pacmanSize = tileSize * 2;
  static double ghostSize = tileSize * 2;
  static double pacmanSpeed = tileSize * 7;
  static double ghostSpeed = tileSize * 8;
  static double pacmanRespawnTime = 1;
  static double ghostRespawnTime = 1;
  static Vector2 pacmanSpawnPosition = Vector2(
    LabyrinthMap.tileSize * 5.5,
    LabyrinthMap.tileSize * 10.5,
  );
  static double ghostRespawnPosition = tileSize * 2;

  static TiledWorldMap map() {
    return TiledWorldMap(
      'pacman/pac_map.json',
      forceTileSize: Size(tileSize, tileSize),
      objectsBuilder: {
        'red': (properties) => Ghost(properties.position, ghostColor: 'red'),
        'blue': (properties) => Ghost(properties.position, ghostColor: 'blue'),
        'pink': (properties) => Ghost(properties.position, ghostColor: 'pink'),
        'orange': (properties) => Ghost(properties.position, ghostColor: 'orange'),
        'food': (properties) => Food(properties.position, points: 10),
      },
    );
  }
}
