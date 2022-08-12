import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pacman/elements/food.dart';
import 'package:pacman/elements/power_up_food.dart';
import 'package:pacman/enemy/ghost.dart';

class PacmanMap {
  static double tileSize = 16;
  static double pacmanSize = tileSize * 2;
  static double ghostSize = tileSize * 2;
  static double pacmanSpeed = tileSize * 7;
  static double ghostSpeed = tileSize * 8;
  static double pacmanRespawnTime = 1;
  static double ghostRespawnTime = 1;
  static Vector2 pacmanSpawnPosition = Vector2(
    PacmanMap.tileSize * 5.5,
    PacmanMap.tileSize * 10.5,
  );
  static Vector2 ghostRespawnPosition = Vector2(
    PacmanMap.tileSize * 5.5,
    PacmanMap.tileSize * 10.5,
  );

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
        'powerUp': (properties) => PowerUpFood(properties.position, points: 1000),
      },
    );
  }

  static enemies() {}
}
