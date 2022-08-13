import 'package:bonfire/state_manager/bonfire_injector.dart';
import 'package:flutter/material.dart';
import 'package:pacman/enemy/ghost_controller.dart';
import 'package:provider/provider.dart';
import 'package:pacman/game/game.dart';
import 'package:pacman/interface/player_score.dart';

/// selects the ammount of food to be spawned in the game.
const bool isLowSpec = true;

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
      title: 'Pacman',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Game(),
    );
  }
}
