import 'package:grpc/grpc.dart';
import 'gameConnector.dart';
import 'schocken_rpc.pb.dart';
import 'schocken_rpc.pbgrpc.dart';
import 'schocken_rpc.pbenum.dart';
import '../shared/gameData.dart';
import '../shared/player.dart';

GameConnector getGameConnector() => GameConnectorMobile();

class GameConnectorMobile extends GameConnector {
  int gameNr = -10;
  String gameName = "";
  String playerName = "";
  int playerNr = 0;
  Function _showDialog;
  bool registered = false;
  String backendIP = 'localhost';
  int port = 50051;
  int timeout = 0;

  GameConnectorMobile() {
    print("init mobile GC");
  }

  void setShowdialog(Function showDialog) {
    this._showDialog = showDialog;
  }

  Future<GameData> touchDice(int diceId) async {
    RpcGameData data = await rpcTouchDice(DiceTouched()
      ..diceId = diceId
      ..playerNr = playerNr
      ..gameNr = gameNr
      ..gameName = gameName
      ..playerName = playerName);
    return convertGameData(data);
  }

  Future<GameData> touchCup() async {
    RpcGameData data = await rpcTouchCup(PlayerInfo()
      ..playerName = playerName
      ..gameName = gameName
      ..playerNr = playerNr
      ..gameNr = gameNr);
    return convertGameData(data);
  }

  Future<GameData> endTurn() async {
    RpcGameData data = await rpcEndTurn(PlayerInfo()
      ..playerName = playerName
      ..gameName = gameName
      ..playerNr = playerNr
      ..gameNr = gameNr);
    return convertGameData(data);
  }

  Future<GameData> refreshGame() async {
    RpcGameData data = await rpcRefreshGame(PlayerInfo()
      ..playerName = playerName
      ..gameName = gameName
      ..playerNr = playerNr
      ..gameNr = gameNr);
    return convertGameData(data);
  }

  Future<GameData> turnSix() async {
    RpcGameData data = await rpcTurnSix(PlayerInfo()
      ..playerName = playerName
      ..gameName = gameName
      ..playerNr = playerNr
      ..gameNr = gameNr);
    return convertGameData(data);
  }

  GameData convertGameData(RpcGameData rpcData) {
    GameData gameData = new GameData();
    gameData.gameName = gameName;

    for (var i = 0; i < rpcData.players.length; i++) {
      gameData.players.add(convertPlayerData(rpcData.players[i]));
    }

    switch (rpcData.gameStatus) {
      case RpcGameData_game_state.ENDED:
        {
          gameData.state = gameStatus.ENDED;
        }
        break;
      case RpcGameData_game_state.ERROR:
        {
          gameData.state = gameStatus.ERROR;
          String title = "Fehler";
          String text = "Server Error.";
          String btnText = "OK";
          this._showDialog(title, text, btnText);
        }
        break;
      case RpcGameData_game_state.LOBBY:
        {
          gameData.state = gameStatus.LOBBY;
          timeout = 0;
        }
        break;
      case RpcGameData_game_state.RUNNING:
        {
          gameData.state = gameStatus.RUNNING;
          timeout = 0;
        }
        break;
      case RpcGameData_game_state.STARTING:
        {
          gameData.state = gameStatus.STARTING;
          timeout = 0;
        }
        break;
      case RpcGameData_game_state.TIMEOUT:
        {
          gameData.state = gameStatus.TIMEOUT;
          if (timeout > 5) {
            String title = "Fehler";
            String text = "Server Timeout.";
            String btnText = "OK";
            this._showDialog(title, text, btnText);
          } else {
            timeout++;
            print(timeout);
          }
        }
        break;
      default:
        {
          gameData.state = gameStatus.ERROR;
        }
    } // end switch

    gameData.activePlayer = convertPlayerData(rpcData.activePlayer);
    print(
        "gameData.activePlayer.dice: " + gameData.activePlayer.dice.toString());
    gameData.activeRoll = rpcData.activeRoll;
    gameData.maxRolls = rpcData.maxRolls;
    gameData.activeCupUp = rpcData.activeCupUp;
    gameData.gameEndMessage = rpcData.message;
    gameData.turnSixButton = rpcData.buttonTurn6;
    gameData.sendReport = rpcData.generateReport;

    return gameData;
  }

  Player convertPlayerData(rpcPlayer) {
    String name = rpcPlayer.playerName;

    playerStatus plStatus;
    if (rpcPlayer.playerStatus == RpcPlayer_player_state.ACTIVE) {
      plStatus = playerStatus.ACTIVE;
    } else if (rpcPlayer.playerStatus == RpcPlayer_player_state.LEFT) {
      plStatus = playerStatus.LEFT;
    } else if (rpcPlayer.playerStatus == RpcPlayer_player_state.PASSIVE) {
      plStatus = playerStatus.PASSIVE;
    } else if (rpcPlayer.playerStatus == RpcPlayer_player_state.SPEC) {
      plStatus = playerStatus.SPEC;
    }

    int harte = rpcPlayer.harte;

    List<int> dices = [];
    for (var j = 0; j < rpcPlayer.dice.length; j++) {
      dices.add(rpcPlayer.dice[j]);
    }

    return new Player(name, plStatus, harte, dices);
  }

  Future<void> getPlayerList(Function updateLobby) async {
    if (this.registered == true) {
      PlayerList playerList;
      playerList = await rpcGetPlayerList(GameID()
        ..gameNr = this.gameNr
        ..gameName = this.gameName);
      if (playerList.status == PlayerList_state.LOBBY) {
        // update Playerlist
        print("call Funktion to update playerlist");
        updateLobby(playerList.playerNames, "LOBBY");
      } else if (playerList.status == PlayerList_state.STARTING) {
        // command to switch to game screen
        print("call Function to switch to gamescreen.");
        updateLobby(playerList.playerNames, "STARTING");
      } else if (playerList.status == PlayerList_state.RUNNING) {
        String title = "Fehler";
        String text = "Dieses Spiel läuft bereits.";
        String btnText = "OK";
        this._showDialog(title, text, btnText);
      } else if (playerList.status == PlayerList_state.ENDED) {
        String title = "Fehler";
        String text = "Dieses Spiel ist beendet.";
        String btnText = "OK";
        this._showDialog(title, text, btnText);
      } else if (playerList.status == PlayerList_state.TIMEOUT) {
        print("getPlayerList Timeout");
        String title = "Fehler";
        String text = "Server Timeout.";
        String btnText = "OK";
        this._showDialog(title, text, btnText);
      }
    } else {
      // do nothing
      print("Die Spielerregistrierung wurde noch nicht abgeschlossen");
    }
  }

  Future<void> registerGame(String playerName, Function updateGameName) async {
    GameID game;
    game = await rpcRegisterGame(PlayerInfo()
      ..playerName = playerName
      ..gameName = "");
    gameNr = game.gameNr;
    gameName = game.gameName;
    updateGameName(game.gameName);
    if (gameNr < 0) {
      print("game.errorMsg: " + gameNr.toString());
      print("game.errorMsg: " + game.errorMsg);
      String title = "Fehler";
      String text =
          "Die Verbindung zum Server konnte nicht hergestellt werden.";
      if (game.errorMsg != "") {
        text = game.errorMsg;
      }
      String btnText = "OK";
      this._showDialog(title, text, btnText);
    } else {
      registerPlayer(playerName, gameName);
    }
  }

  Future<void> registerPlayer(String playerName, String gameName) async {
    print("registerPlayer");
    RegistrationResponse regRes;
    regRes = await rpcRegisterPlayer(PlayerInfo()
      ..playerName = playerName
      ..gameName = gameName);

    if (regRes.returnValue == 0) {
      // registration successful
      this.playerNr = regRes.playerNr;
      this.gameNr = regRes.gameNr;
      this.registered = true;
    } else {
      // registration failed
      String title = "Fehler";
      String text = "Sorry, aber du kannst diesem Spiel grade nicht beitreten.";
      if (regRes.errorMsg != "") {
        text =
            "Sorry, aber du kannst diesem Spiel grade nicht beitreten. Der Grund ist: ${regRes.errorMsg}";
      }
      String btnText = "OK";
      this._showDialog(title, text, btnText);
    }
  }

  Future<void> startGame() async {
    print("registerPlayer");
    StartGameResponse startRes;
    startRes = await rpcStartGame(GameID()..gameName = gameName);

    if (startRes.returnValue == 0) {
      // start successful
      return;
    } else {
      // registration failed
      String title = "Fehler";
      String text = "Sorry, das Spiel kann nicht angelegt werden.";
      if (startRes.errorMsg != "") {
        text =
            "Sorry, aber du kannst diesem Spiel grade nicht beitreten. Der Grund ist: ${startRes.errorMsg}";
      }
      String btnText = "OK";
      this._showDialog(title, text, btnText);
    }
  }

  Future<StartGameResponse> rpcStartGame(param) async {
    final channel = ClientChannel(
      backendIP,
      port: port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = SchockenConnectorClient(channel);
    try {
      final response = await stub.startGame(param).timeout(Duration(seconds: 2),
          onTimeout: () {
        print('start timed out');
        return StartGameResponse()
          ..errorMsg = "TIMEOUT"
          ..returnValue = -2;
      });
      await channel.shutdown();
      return response;
    } catch (e) {
      print('Caught error: $e');
    }
    await channel.shutdown();
    return StartGameResponse()
      ..returnValue = -3
      ..errorMsg = "connection Error!";
  }

  Future<RpcGameData> rpcTouchDice(param) async {
    final channel = ClientChannel(
      backendIP,
      port: port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = SchockenConnectorClient(channel);
    try {
      final response = await stub.touchDice(param).timeout(Duration(seconds: 2),
          onTimeout: () {
        print('0 timed out');
        return RpcGameData()..gameStatus = RpcGameData_game_state.TIMEOUT;
      });
      await channel.shutdown();
      return response;
    } catch (e) {
      print('Caught error: $e');
    }
    await channel.shutdown();
    return RpcGameData()..gameStatus = RpcGameData_game_state.ERROR;
  }

  Future<RpcGameData> rpcTouchCup(param) async {
    final channel = ClientChannel(
      backendIP,
      port: port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = SchockenConnectorClient(channel);
    try {
      final response = await stub.touchCup(param).timeout(Duration(seconds: 2),
          onTimeout: () {
        print('0 timed out');
        return RpcGameData()..gameStatus = RpcGameData_game_state.TIMEOUT;
      });
      await channel.shutdown();
      return response;
    } catch (e) {
      print('Caught error: $e');
    }
    await channel.shutdown();
    return RpcGameData()..gameStatus = RpcGameData_game_state.ERROR;
  }

  Future<RpcGameData> rpcEndTurn(param) async {
    final channel = ClientChannel(
      backendIP,
      port: port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = SchockenConnectorClient(channel);
    try {
      final response = await stub.endTurn(param).timeout(Duration(seconds: 2),
          onTimeout: () {
        print('0 timed out');
        return RpcGameData()..gameStatus = RpcGameData_game_state.TIMEOUT;
      });
      await channel.shutdown();
      return response;
    } catch (e) {
      print('Caught error: $e');
    }
    await channel.shutdown();
    return RpcGameData()..gameStatus = RpcGameData_game_state.ERROR;
  }

  Future<RpcGameData> rpcRefreshGame(param) async {
    final channel = ClientChannel(
      backendIP,
      port: port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = SchockenConnectorClient(channel);
    try {
      final response = await stub
          .refreshGame(param)
          .timeout(Duration(seconds: 2), onTimeout: () {
        print('0 timed out');
        return RpcGameData()..gameStatus = RpcGameData_game_state.TIMEOUT;
      });
      await channel.shutdown();
      return response;
    } catch (e) {
      print('Caught error: $e');
    }
    await channel.shutdown();
    return RpcGameData()..gameStatus = RpcGameData_game_state.ERROR;
  }

  Future<RpcGameData> rpcTurnSix(param) async {
    final channel = ClientChannel(
      backendIP,
      port: port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = SchockenConnectorClient(channel);
    try {
      final response = await stub.turnSix(param).timeout(Duration(seconds: 2),
          onTimeout: () {
        print('0 timed out');
        return RpcGameData()..gameStatus = RpcGameData_game_state.TIMEOUT;
      });
      await channel.shutdown();
      return response;
    } catch (e) {
      print('Caught error: $e');
    }
    await channel.shutdown();
    return RpcGameData()..gameStatus = RpcGameData_game_state.ERROR;
  }

  Future<PlayerList> rpcGetPlayerList(param) async {
    final channel = ClientChannel(
      backendIP,
      port: port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = SchockenConnectorClient(channel);
    try {
      final response = await stub
          .getPlayerList(param)
          .timeout(Duration(seconds: 2), onTimeout: () {
        print('0 timed out');
        return PlayerList()..status = PlayerList_state.TIMEOUT;
      });
      await channel.shutdown();
      return response;
    } catch (e) {
      print('Caught error: $e');
    }
    await channel.shutdown();
    return PlayerList()..status = PlayerList_state.ERROR;
  }

  Future<GameID> rpcRegisterGame(param) async {
    final channel = ClientChannel(
      backendIP,
      port: port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = SchockenConnectorClient(channel);
    try {
      final response = await stub
          .registerGame(param)
          .timeout(Duration(seconds: 2), onTimeout: () {
        print('0 timed out');
        return GameID()..gameNr = 0;
      });
      await channel.shutdown();
      return response;
    } catch (e) {
      print('Caught error: $e');
    }
    await channel.shutdown();
    return GameID()..gameNr = 0;
  }

  Future<RegistrationResponse> rpcRegisterPlayer(param) async {
    final channel = ClientChannel(
      backendIP,
      port: port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = SchockenConnectorClient(channel);
    try {
      final response = await stub
          .registerPlayer(param)
          .timeout(Duration(seconds: 2), onTimeout: () {
        print('0 timed out');
        return RegistrationResponse()
          ..returnValue = 2
          ..errorMsg = "Timeout";
      });
      await channel.shutdown();
      return response;
    } catch (e) {
      print('Caught error: $e');
    }
    await channel.shutdown();
    return RegistrationResponse()
      ..returnValue = 3
      ..errorMsg = "Netzwerkproblem";
  }
}
