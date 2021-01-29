import 'player.dart';

class GameData {
  String gameName = "";
  List<Player> players = [];
  GameStatus state;
  Player activePlayer;
  int activeRoll;
  int maxRolls;
  bool activeCupUp;
  List<String> messages = [];
  bool turnSixButton = false;
  bool sendReport = false;
  int discsOnStack = 0;
  GameRound gameRound;
}

enum GameStatus { LOBBY, STARTING, RUNNING, ENDED, TIMEOUT, ERROR }

enum GameRound {
  ROUND1_FH,
  ROUND1_BACK,
  ROUND2_FH,
  ROUND2_BACK,
  FINALE_FH,
  FINALE_BACK
}
