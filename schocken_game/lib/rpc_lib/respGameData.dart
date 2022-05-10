import 'package:schocken_game/rpc_lib/respPlayer.dart';
import 'package:schocken_game/shared/gameData.dart';
import 'package:schocken_game/shared/player.dart';
import 'package:schocken_game/shared/sharedEnums.dart';

class RespGameData {
  final String gameName;
  final List<Player> players;
  final GameState gameState;
  final int activeRoll;
  final int maxRolls;
  final List<String> messages;
  final bool buttonTurn6;
  final bool generateReport;
  final int discsOnStack;
  final GameRound gameRound;
  final String errorMsg;

  const RespGameData(
      {this.gameName,
      this.players,
      this.gameState,
      this.activeRoll,
      this.maxRolls,
      this.messages,
      this.buttonTurn6,
      this.generateReport,
      this.discsOnStack,
      this.gameRound,
      this.errorMsg});

  factory RespGameData.fromJson(Map<String, dynamic> json) {
    return RespGameData(
      gameName: json['game_name'],
      // https://stackoverflow.com/questions/51053954/how-to-deserialize-a-list-of-objects-from-json-in-flutter
      players: List<dynamic>.from(json['players'])
          .map((i) => RespPlayer.fromJson(i).parseToPlayer())
          .toList(),
      gameState: GameState.values[json['game_state']],
      activeRoll: json['active_roll'],
      maxRolls: json['max_rolls'],
      messages: List<String>.from(json['messages']).map((i) => i).toList(),
      buttonTurn6: json['button_turn6'],
      generateReport: json['generate_report'],
      discsOnStack: json['discs_on_stack'],
      gameRound: GameRound.values[json['game_round']],
      errorMsg: json['error_msg'],
    );
  }

  GameData parseToGameData() {
    GameData gameData = new GameData();
    gameData.gameName = this.gameName;
    gameData.players = this.players;
    gameData.state = this.gameState;
    // gameData.activePlayer = this.;
    gameData.activeRoll = this.activeRoll;
    gameData.maxRolls = this.maxRolls;
    // this.activeCupUp = this.;
    gameData.messages = this.messages;
    gameData.turnSixButton = this.buttonTurn6;
    gameData.sendReport = this.generateReport;
    gameData.discsOnStack = this.discsOnStack;
    gameData.gameRound = this.gameRound;

    // GUI Bugfix: fill active Player:
    for (Player player in gameData.players) {
      if (player.playerState == PlayerState.ACTIVE) {
        gameData.activePlayer = player;
        break;
      }
    }

    // GUI Bugfix: set Active Player Cup Status:
    bool cupUp = true;
    for (int i = 0; i < gameData.activePlayer.dice.length; i++) {
      if (gameData.activePlayer.dice[i] < 1 ||
          gameData.activePlayer.dice[i] > 6) {
        cupUp = false;
      }
    }
    if (gameData.activePlayer.dice.length < 3) {
      cupUp = false;
    }
    gameData.activeCupUp = cupUp;

    return gameData;
  }
}
