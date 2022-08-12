/// Singleton class that checks if the player has collected a power up.

class PowerUPChecker {
  static final PowerUPChecker _instance = PowerUPChecker._internal();
  factory PowerUPChecker() => _instance;
  PowerUPChecker._internal();

  bool _isPoweredUP = false;

  bool get isPoweredUP => _isPoweredUP;

  void setIsPoweredUp(bool value) {
    _isPoweredUP = value;
  }
}
