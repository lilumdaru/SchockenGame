class Player {
  String playerName = "";
  playerStatus playerState;
  int harte;
  List<int> dice = [];

  Player(String name, playerStatus state, int harte, List<int> dice) {
    this.playerName = name;
    this.playerState = state;
    this.harte = harte;
    this.dice = dice;
  }
}

enum playerStatus { ACTIVE, PASSIVE, SPEC, LEFT }
