import 'package:flutter/material.dart';
import 'dart:async';
import '../rpc_lib/restConnector.dart';

class LobbyClient extends StatefulWidget {
  @override
  _LobbyClientState createState() => _LobbyClientState();
}

class _LobbyClientState extends State<LobbyClient> {
  Map data = {};
  RestConnector myGC = RestConnector();
  Timer timer;
  List<String> players = [];
  String gameName = "";
  int refreshIntervall = 500; // ms
  String gameStatus = "";

  @override
  void initState() {
    super.initState();
    gameStatus = "";
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
    // myGC.getPlayerList(updateLobby);
  }

  void updateLobby(List<String> playerNames, String status) {
    if (!mounted) return;
    // if (myGC.gameNr != 0) {
    //   setState(() => this.gameStatus = status);
    //   setState(() => this.players = playerNames);
    // }
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    gameName = data["gameName"].toUpperCase();
    // if (myGC.gameNr == -10) {
    //   // try registerPlayer
    //   myGC.gameNr = -9; // assume registration failed
    //   this.myGC.registerPlayer(data["playerName"], data["gameName"]);
    //   this.myGC.gameName = gameName;
    //   this.myGC.playerName = data["playerName"];
    // }
    if (this.gameStatus == "STARTING") {
      Future.delayed(Duration.zero, () {
        Navigator.pushReplacementNamed(context, '/game', arguments: {
          'GameConnector': this.myGC,
        });
      });
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
    double playerHeight = screenHeightMinusAppBarMinusStatusBar - 46;

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: <Widget>[
          SizedBox(height: 10.0),
          Container(
            height: playerHeight,
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
          SizedBox(height: 10.0),
          Text("Bitte warte bis das Spiel gestartet wird."),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.deepOrange[100],
              width: 800,
              height: 800,
            ),
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }

  void _showDialog(String title, String text, String btnText) {
    // showError
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
