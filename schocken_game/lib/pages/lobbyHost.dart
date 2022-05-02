import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:schocken_game/rpc_lib/gameConnector.dart';
import 'package:schocken_game/shared/sharedEnums.dart';

class LobbyHost extends StatefulWidget {
  @override
  _LobbyHostState createState() => _LobbyHostState();
}

class _LobbyHostState extends State<LobbyHost> {
  Map data = {};
  GameConnector myGC = GameConnector();
  Timer timer;
  List<String> players = [];
  String gameName = "";
  int refreshIntervall = 500; // ms
  GameState gameStatus = GameState.LOBBY;

  @override
  void initState() {
    super.initState();
    // this.myGC.setShowdialog(_showDialog);
    timer = Timer.periodic(Duration(milliseconds: refreshIntervall),
        (Timer t) => getNewPlayerlist());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void getNewPlayerlist() {
    myGC.getPlayerList(updateLobby);
  }

  void updateLobby(List<String> playerNames, GameState status) {
    if (!mounted) return;
    setState(() => this.players = playerNames);
    setState(() => this.gameStatus = status);
  }

  updateGameName(gameName) {
    if (!mounted) return;
    setState(() => this.gameName = gameName.toUpperCase());
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    if (myGC.gameNr == -10) {
      myGC.gameNr = -9;
      this.myGC.registerGame(data["playerName"], updateGameName);
      this.myGC.registerPlayer(data["playerName"], data["gameName"]);
      this.myGC.playerName = data["playerName"];
    }

    AppBar appBar = AppBar(
      title: Text('Schocken v.0: ' + gameName),
      centerTitle: true,
      automaticallyImplyLeading: true,
    );
    double screenHeightMinusAppBarMinusStatusBar =
        MediaQuery.of(context).size.height -
            appBar.preferredSize.height -
            MediaQuery.of(context).padding.top;
    double playerHeight = screenHeightMinusAppBarMinusStatusBar - 170;

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Spielname: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(gameName,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              ),
            ],
          ),
          Text("Teile diesen Spielnamen deinen Mitspielern mit."),
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Divider(
            height: 5.0,
            color: Colors.grey,
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Container(
            height: playerHeight, // todo!!!
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: players.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 1.0, horizontal: 4.0),
                      child: Card(
                        child: ListTile(
                          onTap: () {},
                          title: Text(players[index]),
                        ),
                      ),
                    );
                  })
            ])),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Divider(
            height: 5.0,
            color: Colors.grey,
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
          RaisedButton(
            onPressed: () {
              _startGame();
            },
            child: Text('Spiel starten'),
            color: Colors.lightBlue,
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
        ],
      ),
    );
  }

  void _startGame() async {
    await this.myGC.startGame();

    Navigator.pushReplacementNamed(context, '/game',
        arguments: {'GameConnector': this.myGC});
  }

  void _showDialog(String title, String text, String btnText) {
    Navigator.popUntil(context, ModalRoute.withName('/'));
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(title),
          content: new Text(text),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text(btnText),
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
            ),
          ],
        );
      },
    );
  }
}
