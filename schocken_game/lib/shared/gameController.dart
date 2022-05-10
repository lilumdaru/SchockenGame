import 'package:flutter/material.dart';
import 'package:schocken_game/rpc_lib/respGameData.dart';
import 'package:schocken_game/rpc_lib/respGetPlayerList.dart';
import 'package:schocken_game/rpc_lib/respRegisterGame.dart';
import 'package:schocken_game/rpc_lib/respRegisterPlayer.dart';
import 'package:schocken_game/rpc_lib/respStartGame.dart';
import 'package:schocken_game/rpc_lib/restConnector.dart';
import 'package:schocken_game/shared/functionReturnValues.dart';
import 'package:schocken_game/shared/gameData.dart';
import 'package:schocken_game/shared/sharedEnums.dart';
import 'dart:async';

class GameController extends ChangeNotifier {
  String gameName = "";
  String playerName = "";
  bool registered = false;
  RestConnector rc = RestConnector();
  bool isHost = false;
  List<String> lobbyList = List<String>.filled(0, "");
  GameState state = GameState.LOBBY;
  String ErrorMsg = "";
  GameData gameData = GameData();
  Timer timer; // todo set timer non Null!

  GameController() {
    timer = Timer.periodic(
        Duration(milliseconds: 500), (Timer t) => this.updateData());
  }

  void updateData() {
    if (hasListeners) {
      if (state == GameState.LOBBY) {
        this.getLobbyList();
      } else if (state == GameState.RUNNING ||
          state == GameState.STARTING ||
          state == GameState.SEND_REPORT) {
        this.refreshGame();
      }
    }
  }

  Future<ReturnValue> registerGame(String playerName) async {
    print("playerName: " + playerName);
    this.playerName = playerName;
    RespRegisterGame resRegGame = await rc.registerGame(playerName);
    if (resRegGame.errorMsg != "") {
      print("Error: " + resRegGame.errorMsg);
      this.ErrorMsg = resRegGame.errorMsg;
      return ReturnValue.FAILED;
    }
    this.gameName = resRegGame.gameName;

    return registerPlayer(playerName, this.gameName);
  }

  Future<ReturnValue> registerPlayer(String playerName, String gameName) async {
    // Reset inital Values for Gamestart:
    this.ErrorMsg = "";
    this.state = GameState.LOBBY;
    this.gameData = GameData(); // reset gamedata from previous game
    this.playerName = playerName;
    this.gameName = gameName;
    RespRegisterPlayer resRegPlayer =
        await rc.registerPlayer(playerName, gameName);
    if (resRegPlayer.errorMsg != "") {
      print("Error: " + resRegPlayer.errorMsg);
      this.ErrorMsg = resRegPlayer.errorMsg;
      return ReturnValue.FAILED;
    }
    return ReturnValue.SUCCESS;
  }

  Future<ReturnValue> getLobbyList() async {
    RespGetPlayerList respLobbyList =
        await rc.getPlayerList(this.playerName, this.gameName);
    if (respLobbyList.errorMsg != "") {
      print("Error: " + respLobbyList.errorMsg);
      this.ErrorMsg = respLobbyList.errorMsg;
      notifyListeners();
      return ReturnValue.FAILED;
    }
    this.lobbyList = respLobbyList.playerNames;
    this.state = respLobbyList.gameState;
    notifyListeners();
    return ReturnValue.SUCCESS;
  }

  Future<ReturnValue> startGame() async {
    RespStartGame respStartGame = await rc.startGame(this.gameName);
    if (respStartGame.errorMsg != "") {
      print("Error: " + respStartGame.errorMsg);
      this.ErrorMsg = respStartGame.errorMsg;
      return ReturnValue.FAILED;
    }
    return ReturnValue.SUCCESS;
  }

  Future<ReturnValue> touchDice(int diceId) async {
    RespGameData respGameData =
        await rc.touchDice(diceId, this.playerName, this.gameName);
    if (respGameData.errorMsg != "") {
      print("Error: " + respGameData.errorMsg);
      this.ErrorMsg = respGameData.errorMsg;
      return ReturnValue.FAILED;
    }
    this.gameData = respGameData.parseToGameData();
    this.state = respGameData.gameState;
    notifyListeners();
    return ReturnValue.SUCCESS;
  }

  Future<ReturnValue> touchCup() async {
    RespGameData respGameData =
        await rc.touchCup(this.playerName, this.gameName);
    if (respGameData.errorMsg != "") {
      print("Error: " + respGameData.errorMsg);
      this.ErrorMsg = respGameData.errorMsg;
      return ReturnValue.FAILED;
    }
    this.gameData = respGameData.parseToGameData();
    this.state = respGameData.gameState;
    notifyListeners();
    return ReturnValue.SUCCESS;
  }

  Future<ReturnValue> refreshGame() async {
    RespGameData respGameData =
        await rc.refreshGame(this.playerName, this.gameName);
    if (respGameData.errorMsg != "") {
      print("Error: " + respGameData.errorMsg);
      this.ErrorMsg = respGameData.errorMsg;
      notifyListeners();
      return ReturnValue.FAILED;
    }
    this.gameData = respGameData.parseToGameData();
    this.state = respGameData.gameState;
    notifyListeners();
    return ReturnValue.SUCCESS;
  }

  Future<ReturnValue> endTurn() async {
    RespGameData respGameData =
        await rc.endTurn(this.playerName, this.gameName);
    if (respGameData.errorMsg != "") {
      print("Error: " + respGameData.errorMsg);
      this.ErrorMsg = respGameData.errorMsg;
      return ReturnValue.FAILED;
    }
    this.gameData = respGameData.parseToGameData();
    this.state = respGameData.gameState;
    notifyListeners();
    return ReturnValue.SUCCESS;
  }

  Future<ReturnValue> turnSix() async {
    RespGameData respGameData =
        await rc.turnSix(this.playerName, this.gameName);
    if (respGameData.errorMsg != "") {
      print("Error: " + respGameData.errorMsg);
      this.ErrorMsg = respGameData.errorMsg;
      return ReturnValue.FAILED;
    }
    this.gameData = respGameData.parseToGameData();
    this.state = respGameData.gameState;
    notifyListeners();
    return ReturnValue.SUCCESS;
  }
}
