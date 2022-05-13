import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:schocken_game/rpc_lib/respGameData.dart';
import 'package:schocken_game/rpc_lib/respGetPlayerList.dart';
import 'package:schocken_game/rpc_lib/respRegisterGame.dart';
import 'package:schocken_game/rpc_lib/respRegisterPlayer.dart';
import 'package:schocken_game/rpc_lib/respStartGame.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class RestConnector {
  String backendIP = "http://localhost:8080";
  final HEADER = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };

  RestConnector() {
    loadBackendIP();
  }

  Future loadBackendIP() async {
    await dotenv.load(fileName: "env");
    this.backendIP = dotenv.env['BACKEND_IP'];
    print("BackendIP: " + this.backendIP);
  }

  Future<http.Response> getRequest(String request) async {
    final response = await http.get(Uri.parse(backendIP + "/" + request));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('http.get failed!');
      // todo healing counter?
    }
  }

  Future<http.Response> postRequest(String request, String postBody) async {
    final response = await http.post(
      Uri.parse(backendIP + "/" + request),
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

  Future<RespRegisterGame> registerGame(String playerName) async {
    String postBody = jsonEncode(<String, String>{
      "player_name": playerName,
    });
    var response = await postRequest("game", postBody);
    var respRegGame = RespRegisterGame.fromJson(jsonDecode(response.body));
    return respRegGame;
  }

  Future<RespGameData> touchDice(
      int diceId, String playerName, String gameName) async {
    String postBody = jsonEncode(<String, String>{
      "player_name": playerName,
      "game_name": gameName,
      "dice_id": diceId.toString(),
    });
    var response = await postRequest("dice", postBody);
    var respGameData = RespGameData.fromJson(jsonDecode(response.body));
    return respGameData;
  }

  Future<RespGameData> touchCup(String playerName, String gameName) async {
    String postBody = jsonEncode(<String, String>{
      "player_name": playerName,
      "game_name": gameName,
    });
    var response = await postRequest("cup", postBody);
    var respGameData = RespGameData.fromJson(jsonDecode(response.body));
    return respGameData;
  }

  Future<RespGameData> endTurn(String playerName, String gameName) async {
    String postBody = jsonEncode(<String, String>{
      "player_name": playerName,
      "game_name": gameName,
    });
    var response = await postRequest("turn", postBody);
    RespGameData respGameData =
        RespGameData.fromJson(jsonDecode(response.body));
    return respGameData;
  }

  Future<RespGameData> refreshGame(String playerName, String gameName) async {
    var response = await getRequest(
        "game?" + "player_name=" + playerName + "&game_name=" + gameName);
    RespGameData respGameData =
        RespGameData.fromJson(jsonDecode(response.body));
    return respGameData;
  }

  Future<RespGameData> turnSix(String playerName, String gameName) async {
    String postBody = jsonEncode(<String, String>{
      "player_name": playerName,
      "game_name": gameName,
    });
    var response = await postRequest("six", postBody);
    var respGameData = RespGameData.fromJson(jsonDecode(response.body));
    return respGameData;
  }

  Future<RespGetPlayerList> getPlayerList(
      String playerName, String gameName) async {
    var response = await this.getRequest("playerlist?" +
        "player_name=" +
        playerName +
        "&" +
        "game_name=" +
        gameName);
    var respGetPlayerList =
        RespGetPlayerList.fromJson(jsonDecode(response.body));
    return respGetPlayerList;
  }

  Future<RespRegisterPlayer> registerPlayer(
      String playerName, String gameName) async {
    String postBody = jsonEncode(
        <String, String>{"player_name": playerName, "game_name": gameName});
    var response = await postRequest("player", postBody);
    var respRegPlayer = RespRegisterPlayer.fromJson(jsonDecode(response.body));
    return respRegPlayer;
  }

  Future<RespStartGame> startGame(String gameName) async {
    String postBody = jsonEncode(<String, String>{"game_name": gameName});
    var response = await postRequest("gamestart", postBody);
    var respStartGame = RespStartGame.fromJson(jsonDecode(response.body));
    return respStartGame;
  }
}
