import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pacman/game/map.dart';
import 'package:pacman/player/player_score.dart';
import 'package:provider/provider.dart';

/// Interface for the score of the player, updated by the provider [PlayerScore].
class PacmanScoreInterface extends StatelessWidget {
  const PacmanScoreInterface({Key? key}) : super(key: key);

  final int winningScore = 10 * 244 + 100 * 4;

  @override
  Widget build(BuildContext context) {
    final PlayerScore playerScore = context.watch<PlayerScore>();
    bool isGameOver = playerScore.playerLives == 0;
    bool isWinningScore = playerScore.score >= winningScore;

    return Column(
      children: [
        SizedBox(height: PacmanMap.tileSize * 1),
        Row(
          children: [
            SizedBox(width: PacmanMap.tileSize * 6),
            (isWinningScore)
                ? Column(
                    children: [
                      _RetroText('YOU WON!!!', fontSize: 18),
                      _RetroText('Total score: ${playerScore.score}', fontSize: 16)
                    ],
                  )
                : (isGameOver)
                    ? Column(
                        children: [
                          _RetroText('GAME OVER!', fontSize: 18),
                          _RetroText('Total score: ${playerScore.score}', fontSize: 16)
                        ],
                      )
                    : _RetroText('${playerScore.score}', fontSize: 30),
            SizedBox(width: PacmanMap.tileSize * 2),
            // row of image assets for lives
            for (int i = 0; i < playerScore.playerLives - 1; i++)
              Image.asset(
                'assets/images/player/pacman_idle.png',
                // width: 100,
                // height: 100,
                scale: 0.5,
              ),
          ],
        ),
      ],
    );
  }
}

class _RetroText extends StatelessWidget {
  const _RetroText(this.text, {Key? key, this.fontSize = 22}) : super(key: key);
  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.pressStart2p(
        decoration: TextDecoration.none,
        fontSize: fontSize,
        color: Color.fromARGB(188, 255, 255, 255),
      ),
    );
  }
}
