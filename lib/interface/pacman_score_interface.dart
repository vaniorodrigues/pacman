import 'package:flutter/material.dart';
import 'package:pacman/game/map.dart';
import 'package:pacman/player/player_score.dart';
import 'package:provider/provider.dart';
// import 'package:google_fonts/google_fonts.dart';

class PacmanScoreInterface extends StatelessWidget {
  const PacmanScoreInterface({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PlayerScore playerScore = context.watch<PlayerScore>();
    // 244 normal foods, 4 power foods
    // final int maxScore = 244 * PacmanMap.foodScore + 4 * PacmanMap.powerUpFoodScore;

    return Row(
      children: [
        SizedBox(width: PacmanMap.tileSize),
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
            SizedBox(height: PacmanMap.tileSize / 4),
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
