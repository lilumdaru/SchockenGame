import 'package:schocken_game/shared/sharedEnums.dart';
import 'player.dart';

class GameData {
  String gameName = "";
  List<Player> players = [];
  GameState state;
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
