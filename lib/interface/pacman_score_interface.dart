import 'package:flutter/material.dart';
import 'package:pacman/game/map.dart';
import 'package:pacman/player/player_score.dart';
import 'package:provider/provider.dart';

class PacmanScoreInterface extends StatelessWidget {
  const PacmanScoreInterface({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PlayerScore playerScore = context.watch<PlayerScore>();

    return Row(
      children: [
        SizedBox(width: LabyrinthMap.tileSize),
        Column(
          children: [
            Text(
              'Score: ${playerScore.score}',
              style: TextStyle(
                backgroundColor: Colors.black,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(height: LabyrinthMap.tileSize / 4),
            Text(
              'Lives: ${playerScore.playerLives}',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            )
          ],
        ),
      ],
    );
  }
}