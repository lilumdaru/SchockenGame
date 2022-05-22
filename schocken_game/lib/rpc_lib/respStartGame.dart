class RespStartGame {
  final String errorMsg;

  const RespStartGame({this.errorMsg});

  factory RespStartGame.fromJson(Map<String, dynamic> json) {
    return RespStartGame(
      errorMsg: json['error_msg'],
    );
  }
}
