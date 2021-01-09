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
  List<String> messages = [];
  bool turnSixButton = false;
  bool sendReport = false;
  int discsOnStack = 0;
}

enum gameStatus { LOBBY, STARTING, RUNNING, ENDED, TIMEOUT, ERROR }
