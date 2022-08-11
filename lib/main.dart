import 'package:bonfire/state_manager/bonfire_injector.dart';
import 'package:flutter/material.dart';
import 'package:pacman/enemy/ghost_controller.dart';
import 'package:pacman/player/player_score.dart';
import 'package:provider/provider.dart';

import 'map/game.dart';

const double tileSize = 16;

void main() {
  BonfireInjector().putFactory((i) => GhostController());

  runApp(ChangeNotifierProvider(
    create: (context) => PlayerScore(
      playerLives: 3,
    ),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Game(),
    );
  }
}
