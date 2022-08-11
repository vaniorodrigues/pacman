import 'package:bonfire/bonfire.dart';

import 'package:flutter/widgets.dart';

class Food extends GameDecoration {
  bool _observedPlayer = false;

  late TextPaint _textConfig;
  Food(Vector2 position)
      : super(
          size: Vector2(8, 8),
          position: position,
        ) {
    _textConfig = TextPaint(
      style: TextStyle(
        color: Color(0xFFFFFFFF),
        fontSize: width / 2,
      ),
    );
  }

//   @override
//   void update(double dt) {
//     if (gameRef.player != null) {
//       this.seeComponent(
//         gameRef.player!,
//         observed: (player) {
//           if (!_observedPlayer) {
//             _observedPlayer = true;
//             _showEmote();
//           }
//         },
//         notObserved: () {
//           _observedPlayer = false;
//         },
//         radiusVision: DungeonMap.tileSize,
//       );
//     }
//     super.update(dt);
//   }

//   @override
//   void render(Canvas canvas) {
//     super.render(canvas);
//     if (_observedPlayer) {
//       _textConfig.render(
//         canvas,
//         'Touch me !!',
//         Vector2(x - width / 1.5, center.y - (height + 5)),
//       );
//     }
//   }

//   @override
//   void onTap() {
//     if (_observedPlayer) {
//       _addPotions();
//       removeFromParent();
//     }
//   }

//   @override
//   void onTapCancel() {}

//   void _addPotions() {
//     gameRef.add(
//       PotionLife(
//         Vector2(
//           position.translate(width * 2, 0).x,
//           position.y - height * 2,
//         ),
//         30,
//       ),
//     );

//     gameRef.add(
//       PotionLife(
//         Vector2(
//           position.translate(width * 2, 0).x,
//           position.y + height * 2,
//         ),
//         30,
//       ),
//     );

//     _addSmokeExplosion(position.translate(width * 2, 0));
//     _addSmokeExplosion(position.translate(width * 2, height * 2));
//   }

//   void _addSmokeExplosion(Vector2 position) {
//     gameRef.add(
//       AnimatedObjectOnce(
//         animation: CommonSpriteSheet.smokeExplosion,
//         position: position,
//         size: Vector2.all(DungeonMap.tileSize),
//       ),
//     );
//   }

//   void _showEmote() {
//     gameRef.add(
//       AnimatedFollowerObject(
//         animation: CommonSpriteSheet.emote,
//         target: this,
//         size: size,
//         positionFromTarget: size / -2,
//       ),
//     );
//   }
}
