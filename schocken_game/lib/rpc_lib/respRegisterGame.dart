class RespRegisterGame {
  final int gameId;
  final String gameName;
  final String errorMsg;

  const RespRegisterGame({this.gameId, this.gameName, this.errorMsg});

  factory RespRegisterGame.fromJson(Map<String, dynamic> json) {
    return RespRegisterGame(
      gameId: json['game_id'],
      gameName: json['game_name'],
      errorMsg: json['error_msg'],
    );
  }
}
