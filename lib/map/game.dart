import 'package:bonfire/bonfire.dart';
import 'package:bonfire/tiled/model/tiled_object_properties.dart';
import 'package:flutter/material.dart';
import 'package:pacman/enemy/ghost.dart';
import 'package:pacman/player/pacman.dart';

class Game extends StatelessWidget {
  const Game({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
      joystick: Joystick(
        // directional: JoystickDirectional(),
        keyboardConfig: KeyboardConfig(
          keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
        ),
      ), // required
      map: TiledWorldMap(
        'pacman/pac_map.json',
        forceTileSize: Size(10, 10),
        objectsBuilder: {
          'red': (TiledObjectProperties properties) => Goblin(properties.position),
          // 'pacman': (properties) => Pacman(properties.position),
        },
      ),
      player: Pacman(
        Vector2(30, 30),
      ),
      showCollisionArea: true,
      cameraConfig: CameraConfig(
          // target: GameComponent(),
          // smoothCameraEnabled: true,
          // smoothCameraSpeed: 2,
          ),
    );
  }
}
