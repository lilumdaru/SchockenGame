import 'package:schocken_game/shared/sharedEnums.dart';

class RespGetPlayerList {
  final GameState gameState;
  final List<String> playerNames;
  final String errorMsg;

  const RespGetPlayerList({this.gameState, this.playerNames, this.errorMsg});

  factory RespGetPlayerList.fromJson(Map<String, dynamic> json) {
    return RespGetPlayerList(
      gameState: GameState.values[json['game_state']],
      // playerNames: json['player_names'],
      playerNames: (json['player_names'] as List<dynamic>).cast<String>(),
      errorMsg: json['error_msg'],
    );
  }
}
