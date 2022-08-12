import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pacman/interface/pacman_score_interface.dart';
import 'package:pacman/game/map.dart';
import 'package:pacman/player/pacman.dart';
import 'package:pacman/player/player_score.dart';
import 'package:provider/provider.dart';

class Game extends StatelessWidget {
  const Game({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('Rebuilding game');

    // context.watch<PlayerScore>().playerLives;
    return LayoutBuilder(
      builder: (context, constraints) {
        LabyrinthMap.tileSize = min(constraints.maxHeight, constraints.maxWidth) / 35;

        return BonfireTiledWidget(
          joystick: Joystick(
            keyboardConfig: KeyboardConfig(
              keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
            ),
          ), // required
          map: LabyrinthMap.map(),
          player: Pacman(LabyrinthMap.pacmanSpawnPosition),
          showCollisionArea: true,
          cameraConfig: CameraConfig(
            sizeMovementWindow: Vector2(
              LabyrinthMap.tileSize * 100,
              LabyrinthMap.tileSize * 100,
            ),
          ),
          overlayBuilderMap: {
            'score': (context, game) => PacmanScoreInterface(),
          },
          initialActiveOverlays: const ['score'],
        );
      },
    );
  }
}
