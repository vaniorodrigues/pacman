import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pacman/elements/food.dart';
import 'package:pacman/elements/power_up_food.dart';
import 'package:pacman/enemy/ghost.dart';

class PacmanMap {
  static double tileSize = 16;
  static double pacmanSize = tileSize * 2;
  static double ghostSize = tileSize * 1.8;
  static double pacmanSpeed = tileSize * 5;
  static double ghostSpeed = tileSize * 4;
  static double pacmanRespawnTime = 1;
  static double ghostRespawnTime = 1;
  static Duration powerUpDuration = Duration(seconds: 2);
  static Vector2 pacmanSpawnPosition = Vector2(
    PacmanMap.tileSize * 18,
    PacmanMap.tileSize * 19.75,
  );
  static List<Vector2> ghostRespawnPositions = [
    Vector2(PacmanMap.tileSize * 16, PacmanMap.tileSize * 17),
    Vector2(PacmanMap.tileSize * 18, PacmanMap.tileSize * 17),
    Vector2(PacmanMap.tileSize * 20, PacmanMap.tileSize * 17),
    Vector2(PacmanMap.tileSize * 18, PacmanMap.tileSize * 15),
  ];
  // static Vector2 ghostRespawnPosition = Vector2(
  //   PacmanMap.tileSize * 6.5,
  //   PacmanMap.tileSize * 10.5,
  // );

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
