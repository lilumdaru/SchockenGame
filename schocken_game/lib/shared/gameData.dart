// import '../rpc_lib/gameConnector.dart';
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

  // GameData(GameConnector myGC_in) {
  //   this.myGC = myGC_in;
  // }
}

enum gameStatus { LOBBY, STARTING, RUNNING, ENDED, TIMEOUT, ERROR }
