import 'package:flutter/material.dart';

class PlayerScore extends ChangeNotifier {
  int score;
  int playerLives;
  bool isPoweredUP = true;

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

  void setIsPoweredUp(bool value) {
    isPoweredUP = value;
    notifyListeners();
  }
}
