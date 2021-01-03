import 'schocken_rpc.pb.dart';
import 'schocken_rpc.pbgrpc.dart';
import '../shared/gameData.dart';
import '../shared/player.dart';
import 'gameConnectorStub.dart'
    if (dart.library.io) 'gameConnectorMobile.dart'
    if (dart.library.js) 'gameConnectorWeb.dart';

abstract class GameConnector {
  int gameNr = -10;
  String gameName = "";
  String playerName = "";
  int playerNr = 0;
  bool registered = false;
  String backendIP = 'localhost'; // host
  int port = 50051;
  int timeout = 0;

  static GameConnector _instance;

  static GameConnector get instance {
    _instance ??= getGameConnector();
    _instance.gameNr = -10;
    _instance.gameName = "";
    _instance.registered = false;
    return _instance;
  }

  GameConnector();

  void setShowdialog(Function showDialog);

  Future<GameData> touchDice(int diceId);

  Future<GameData> touchCup();

  Future<GameData> endTurn();

  Future<GameData> refreshGame();

  Future<GameData> turnSix();

  GameData convertGameData(RpcGameData rpcData);

  Player convertPlayerData(rpcPlayer);

  Future<void> getPlayerList(Function updateLobby);

  Future<void> registerGame(String playerName, Function updateGameName);

  Future<void> registerPlayer(String playerName, String gameName);

  Future<void> startGame();

  Future<StartGameResponse> rpcStartGame(param);

  Future<RpcGameData> rpcTouchDice(param);

  Future<RpcGameData> rpcTouchCup(param);

  Future<RpcGameData> rpcEndTurn(param);

  Future<RpcGameData> rpcRefreshGame(param);

  Future<RpcGameData> rpcTurnSix(param);

  Future<PlayerList> rpcGetPlayerList(param);

  Future<GameID> rpcRegisterGame(param);

  Future<RegistrationResponse> rpcRegisterPlayer(param);
}
