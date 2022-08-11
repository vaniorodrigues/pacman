import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:pacman/map/map.dart';
import 'package:pacman/player/pacman.dart';
import 'package:pacman/player/player_score.dart';
import 'package:provider/provider.dart';

class Game extends StatelessWidget {
  const Game({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PlayerScore playerScore = context.watch<PlayerScore>();

    return LayoutBuilder(
      builder: (context, constraints) {
        LabyrinthMap.tileSize = max(constraints.maxHeight, constraints.maxWidth) / (kIsWeb ? 12 : 12);
        return BonfireTiledWidget(
          joystick: Joystick(
            keyboardConfig: KeyboardConfig(
              keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
            ),
          ), // required
          map: LabyrinthMap.map(),
          player: Pacman(Vector2(LabyrinthMap.tileSize * 6, LabyrinthMap.tileSize * 10)),
          showCollisionArea: true,
          cameraConfig: CameraConfig(
            zoom: 0.3,
            sizeMovementWindow: Vector2(
              LabyrinthMap.tileSize * 100,
              LabyrinthMap.tileSize * 100,
            ),
          ),
        );
      },
    );
  }
}
