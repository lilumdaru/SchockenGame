import 'package:schocken_game/rpc_lib/respGetPlayerList.dart';
import 'package:schocken_game/rpc_lib/respRegisterGame.dart';
import 'package:schocken_game/rpc_lib/respRegisterPlayer.dart';
import 'package:schocken_game/rpc_lib/restConnector.dart';
import 'package:schocken_game/shared/sharedEnums.dart';
import 'package:flutter/material.dart';

class GameController {
  String gameName = "";
  String playerName = "";
  bool registered = false;
  RestConnector rc = RestConnector();
  bool isHost = false;

  Future<int> registerGame(String playerName) async {
    print("playerName: " + playerName);
    this.playerName = playerName;
    RespRegisterGame resRegGame = await rc.registerGame(playerName);
    if (resRegGame.errorMsg != "") {
      print("Error: " + resRegGame.errorMsg);
      return 1;
    }
    this.gameName = resRegGame.gameName;
    this.isHost = true;

    return registerPlayer(playerName, this.gameName);
  }

  Future<int> registerPlayer(String playerName, String gameName) async {
    this.playerName = playerName;
    this.gameName = gameName;
    RespRegisterPlayer resRegPlayer =
        await rc.registerPlayer(playerName, gameName);
    if (resRegPlayer.errorMsg != "") {
      print("Error: " + resRegPlayer.errorMsg);
      return 1;
    }
    print("change to lobby");
    return 0;
  }

  Future<List<String>> getLobbyList() async {
    RespGetPlayerList respLobbyList =
        await rc.getPlayerList(this.playerName, this.gameName);
    if (respLobbyList.errorMsg != "") {
      print("Error: " + respLobbyList.errorMsg);
      return respLobbyList.playerNames;
    }
    if (respLobbyList.gameState == GameState.STARTING) {
      print("start Game");
    }
    return respLobbyList.playerNames;
  }
}
