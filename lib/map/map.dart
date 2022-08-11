import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:pacman/elements/food.dart';
import 'package:pacman/enemy/ghost.dart';

class LabyrinthMap {
  static double tileSize = 16;

  static TiledWorldMap map() {
    return TiledWorldMap(
      'pacman/pac_map.json',
      forceTileSize: Size(tileSize, tileSize),
      objectsBuilder: {
        // 'red': (properties) => Ghost(properties.position),
        'food': (properties) => Food(properties.position, points: 1),
      },
    );
  }
}
