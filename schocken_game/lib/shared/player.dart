class Player {
  String playerName = "";
  playerStatus playerState;
  int harte;
  List<int> dice = [];
  bool lostHalf = false;

  Player(String name, playerStatus state, int harte, List<int> dice) {
    this.playerName = name;
    this.playerState = state;
    this.harte = harte;
    this.dice = dice;
  }
}

enum playerStatus { ACTIVE, PASSIVE, SPEC, LEFT }
