import 'package:schocken_game/shared/sharedEnums.dart';

class Player {
  String playerName = "";
  PlayerState playerState;
  int harte;
  List<int> dice = [];
  bool lostHalf = false;

  Player(String name, PlayerState state, int harte, List<int> dice,
      bool lostHalf) {
    this.playerName = name;
    this.playerState = state;
    this.harte = harte;
    this.dice = dice;
    this.lostHalf = lostHalf;
  }
}
