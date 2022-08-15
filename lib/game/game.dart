import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pacman/interface/pacman_score_interface.dart';
import 'package:pacman/game/pacman_map.dart';
import 'package:pacman/joystick/joystick_wout_idle.dart';
import 'package:pacman/player/pacman.dart';

/// Main fuction of the game.
class Game extends StatelessWidget {
  const Game({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        PacmanMap.tileSize = min(constraints.maxHeight, constraints.maxWidth) / 35;
        return BonfireTiledWidget(
          // showCollisionArea: true,
          joystick: JoystickWoutIdle(
            keyboardConfig: KeyboardConfig(
              keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
            ),
          ), // required
          map: PacmanMap.map(),
          player: Pacman(PacmanMap.pacmanRespawnPosition),
          cameraConfig: CameraConfig(
            sizeMovementWindow: Vector2(
              PacmanMap.tileSize * 100,
              PacmanMap.tileSize * 100,
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
