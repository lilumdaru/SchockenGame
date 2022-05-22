class RespRegisterPlayer {
  final int gameId;
  final String errorMsg;

  const RespRegisterPlayer({this.gameId, this.errorMsg});

  factory RespRegisterPlayer.fromJson(Map<String, dynamic> json) {
    return RespRegisterPlayer(
      gameId: json['game_id'],
      errorMsg: json['error_msg'],
    );
  }
}
