import 'package:schocken_game/rpc_lib/respGetPlayerList.dart';
import 'package:schocken_game/rpc_lib/respRegisterGame.dart';
import 'package:schocken_game/rpc_lib/respRegisterPlayer.dart';
import 'package:schocken_game/rpc_lib/restConnector.dart';
import 'package:schocken_game/shared/functionReturnValues.dart';
import 'package:schocken_game/shared/sharedEnums.dart';
import 'package:flutter/material.dart';

class GameController {
  String gameName = "";
  String playerName = "";
  bool registered = false;
  RestConnector rc = RestConnector();
  bool isHost = false;
  List<String> lobbyList = List<String>.filled(0, "");
  GameState state = GameState.LOBBY;

  Future<ReturnValue> registerGame(String playerName) async {
    print("playerName: " + playerName);
    this.playerName = playerName;
    RespRegisterGame resRegGame = await rc.registerGame(playerName);
    if (resRegGame.errorMsg != "") {
      print("Error: " + resRegGame.errorMsg);
      return ReturnValue.FAILED;
    }
    this.gameName = resRegGame.gameName;

    return registerPlayer(playerName, this.gameName);
  }

  Future<ReturnValue> registerPlayer(String playerName, String gameName) async {
    this.state = GameState.LOBBY;
    this.playerName = playerName;
    this.gameName = gameName;
    RespRegisterPlayer resRegPlayer =
        await rc.registerPlayer(playerName, gameName);
    if (resRegPlayer.errorMsg != "") {
      print("Error: " + resRegPlayer.errorMsg);
      return ReturnValue.FAILED;
    }
    print("change to lobby");
    return ReturnValue.SUCCESS;
  }

  Future<ReturnValue> getLobbyList() async {
    RespGetPlayerList respLobbyList =
        await rc.getPlayerList(this.playerName, this.gameName);
    if (respLobbyList.errorMsg != "") {
      print("Error: " + respLobbyList.errorMsg);
      return ReturnValue.FAILED;
    }
    // if (respLobbyList.gameState == GameState.STARTING) {
    //   print("start Game");
    //   // Navigation is done in lobby.dart
    // }
    this.lobbyList = respLobbyList.playerNames;
    this.state = respLobbyList.gameState;
    return ReturnValue.SUCCESS;
  }
}
