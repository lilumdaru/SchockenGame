import 'player.dart';

class GameData {
  // GameConnector myGC;
  String gameName = "";
  List<Player> players = [];
  gameStatus state;
  Player activePlayer;
  int activeRoll;
  int maxRolls;
  bool activeCupUp;
  String gameEndMessage;
  bool turnSixButton = false;
  bool sendReport = false;
}

enum gameStatus { LOBBY, STARTING, RUNNING, ENDED, TIMEOUT, ERROR }
