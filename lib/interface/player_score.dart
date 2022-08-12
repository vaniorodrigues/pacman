import 'package:flutter/material.dart';

/// Provider of that controlles the score of the game and the lives of the player.
/// If [playersLives] != 0 is game over.
class PlayerScore extends ChangeNotifier {
  int score;
  int playerLives;

  PlayerScore({
    required this.playerLives,
    this.score = 0,
  });

  void addPointsToPlayerScore(int score) {
    this.score += score;
    notifyListeners();
  }

  void removeLifeFromPlayer() {
    playerLives--;
    notifyListeners();
  }
}
