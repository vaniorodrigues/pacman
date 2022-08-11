import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

class GameTiledMap extends StatelessWidget {
  final int map;

  const GameTiledMap({Key? key, this.map = 1}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
        // joystick: Joystick(
        //   keyboardConfig: KeyboardConfig(
        //     keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
        //     acceptedKeys: [
        //       LogicalKeyboardKey.space,
        //     ],
        //   ),
        //   directional: JoystickDirectional(
        //     spriteBackgroundDirectional: Sprite.load(
        //       'joystick_background.png',
        //     ),
        //     spriteKnobDirectional: Sprite.load('joystick_knob.png'),
        //     size: 100,
        //     isFixed: false,
        //   ),
        //   actions: [
        //     JoystickAction(
        //       actionId: PlayerAttackType.AttackMelee,
        //       sprite: Sprite.load('joystick_atack.png'),
        //       align: JoystickActionAlign.BOTTOM_RIGHT,
        //       size: 80,
        //       margin: EdgeInsets.only(bottom: 50, right: 50),
        //     ),
        //     JoystickAction(
        //       // actionId: PlayerAttackType.AttackRange,
        //       sprite: Sprite.load('joystick_atack_range.png'),
        //       spriteBackgroundDirection: Sprite.load(
        //         'joystick_background.png',
        //       ),
        //       enableDirection: true,
        //       size: 50,
        //       margin: EdgeInsets.only(bottom: 50, right: 160),
        //     )
        //   ],
        // ),
        // player: Knight(
        //   Vector2((8 * DungeonMap.tileSize), (5 * DungeonMap.tileSize)),
        // ),
        // interface: KnightInterface(),
        map: TiledWorldMap(
          'tiled/mapa$map.json',
          // 'mapa.json',
          // forceTileSize: Size(DungeonMap.tileSize, DungeonMap.tileSize),
          objectsBuilder: {
            // 'goblin': (properties) => Goblin(properties.position),
            // 'torch': (properties) => Torch(properties.position),
            // 'barrel': (properties) => BarrelDraggable(properties.position),
            // 'spike': (properties) => Spikes(properties.position),
            // 'column': (properties) => ColumnDecoration(properties.position),
            // 'chest': (properties) => Chest(properties.position),
            // 'critter': (properties) => Critter(properties.position),
            // 'wizard': (properties) => Wizard(properties.position),
          },
        ),
        background: BackgroundColorGame(Colors.blueGrey[900]!),
        lightingColorGame: Colors.black.withOpacity(0.7),
        cameraConfig: CameraConfig(
          smoothCameraEnabled: true,
          smoothCameraSpeed: 2,
        ));
  }
}
