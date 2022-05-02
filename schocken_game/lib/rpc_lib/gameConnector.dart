import 'dart:async';
import 'dart:convert';
import 'package:schocken_game/rpc_lib/respGameData.dart';
import 'package:schocken_game/rpc_lib/respGetPlayerList.dart';
import 'package:schocken_game/rpc_lib/respRegisterGame.dart';
import 'package:schocken_game/rpc_lib/respRegisterPlayer.dart';
import 'package:schocken_game/rpc_lib/respStartGame.dart';

import '../shared/gameData.dart';
import 'package:http/http.dart' as http;

class GameConnector {
  int gameNr = -10;
  String gameName = "";
  String playerName = "";
  // int playerNr = 0;
  bool registered = false;
  String backendIP = 'localhost';
  final HEADER = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };

  GameConnector() {
    print("init Rest GC");
  }

  Future<http.Response> getRequest(String request) async {
    final response = await http.get(Uri.parse("backendIP" + "/" + request));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('http.get failed!');
      // todo healing counter?
    }
  }

  Future<http.Response> postRequest(String request, String postBody) async {
    final response = await http.post(
      Uri.parse("backendIP" + "/" + request),
      headers: HEADER,
      body: postBody,
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('http.post failed!');
      // todo healing counter?
    }
  }

  Future<void> registerGame(String playerName, Function updateGameName) async {
    String postBody = jsonEncode(<String, String>{
      "player_name": playerName,
    });
    var response = await postRequest("game", postBody);
    var respRegGame = RespRegisterGame.fromJson(jsonDecode(response.body));
    if (respRegGame.errorMsg != "") {
      throw Exception('Server Error: ' + respRegGame.errorMsg);
    }
    gameNr = respRegGame.gameId;
    gameName = respRegGame.gameName;
  }

  Future<GameData> touchDice(int diceId) async {
    String postBody = jsonEncode(<String, String>{
      "player_name": this.playerName,
      "game_name": this.gameName,
      "dice_id": diceId.toString(),
    });
    var response = await postRequest("dice", postBody);
    var respGameData = RespGameData.fromJson(jsonDecode(response.body));
    if (respGameData.errorMsg != "") {
      throw Exception('Server Error: ' + respGameData.errorMsg);
    }
    return respGameData.parseToGameData();
  }

  Future<GameData> touchCup() async {
    String postBody = jsonEncode(<String, String>{
      "player_name": this.playerName,
      "game_name": this.gameName,
    });
    var response = await postRequest("cup", postBody);
    var respGameData = RespGameData.fromJson(jsonDecode(response.body));
    if (respGameData.errorMsg != "") {
      throw Exception('Server Error: ' + respGameData.errorMsg);
    }
    return respGameData.parseToGameData();
  }

  Future<GameData> endTurn() async {
    String postBody = jsonEncode(<String, String>{
      "player_name": this.playerName,
      "game_name": this.gameName,
    });
    var response = await postRequest("turn", postBody);
    var respGameData = RespGameData.fromJson(jsonDecode(response.body));
    if (respGameData.errorMsg != "") {
      throw Exception('Server Error: ' + respGameData.errorMsg);
    }
    return respGameData.parseToGameData();
  }

  Future<GameData> refreshGame() async {
    var response = await getRequest("game?" +
        "player_name=" +
        this.playerName +
        "&game_name=" +
        this.gameName);
    var respGameData = RespGameData.fromJson(jsonDecode(response.body));
    if (respGameData.errorMsg != "") {
      throw Exception('Server Error: ' + respGameData.errorMsg);
    }
    return respGameData.parseToGameData();
  }

  Future<GameData> turnSix() async {
    String postBody = jsonEncode(<String, String>{
      "player_name": this.playerName,
      "game_name": this.gameName,
    });
    var response = await postRequest("six", postBody);
    var respGameData = RespGameData.fromJson(jsonDecode(response.body));
    if (respGameData.errorMsg != "") {
      throw Exception('Server Error: ' + respGameData.errorMsg);
    }
    return respGameData.parseToGameData();
  }

  Future<void> getPlayerList(Function updateLobby) async {
    var response = await this.getRequest("playerlist?" +
        "player_name=" +
        this.playerName +
        "&" +
        "game_name=" +
        this.gameName);
    var respGetPlayerList =
        RespGetPlayerList.fromJson(jsonDecode(response.body));
    if (respGetPlayerList.errorMsg != "") {
      throw Exception('Server Error: ' + respGetPlayerList.errorMsg);
    }
    updateLobby(respGetPlayerList.playerNames, respGetPlayerList.gameState);
  }

  Future<void> registerPlayer(String playerName, String gameName) async {
    String postBody = jsonEncode(
        <String, String>{"player_name": playerName, "game_name": gameName});
    var response = await postRequest("game", postBody);
    var respRegPlayer = RespRegisterPlayer.fromJson(jsonDecode(response.body));
    if (respRegPlayer.errorMsg != "") {
      throw Exception('Server Error: ' + respRegPlayer.errorMsg);
    }
    // this.playerNr = respRegPlayer.playerNr;
    this.gameNr = respRegPlayer.gameId;
    this.registered = true;
  }

  Future<void> startGame() async {
    String postBody = jsonEncode(<String, String>{"game_name": this.gameName});
    var response = await postRequest("gamestart", postBody);
    var respStartGame = RespStartGame.fromJson(jsonDecode(response.body));
    if (respStartGame.errorMsg != "") {
      throw Exception('Server Error: ' + respStartGame.errorMsg);
    }
  }
}
