import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:schocken_game/rpc_lib/restConnector.dart';
import 'package:schocken_game/shared/gameController.dart';
import 'package:schocken_game/shared/sharedEnums.dart';
import '../shared/functionReturnValues.dart';

final getIt = GetIt.instance;

class Lobby extends StatefulWidget {
  @override
  _LobbyState createState() => _LobbyState();
}

class _LobbyState extends State<Lobby> {
  RestConnector myGC = RestConnector();
  Timer timer;
  int refreshIntervall = 500; // ms

  @override
  void initState() {
    print("Lobby");
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
    getIt<GameController>().getLobbyList().then((fncReturn) => {
          if (fncReturn == ReturnValue.SUCCESS) {updateLobby()}
        });
  }

  void updateLobby() {
    if (!mounted) return;

    if (getIt<GameController>().state == GameState.STARTING) {
      Navigator.pushReplacementNamed(context, '/game', arguments: {
        'GameConnector': this.myGC,
      });
      return;
    }

    setState(() => {});
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text('Schocken v.0: ' + getIt<GameController>().gameName),
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
                child: Text(getIt<GameController>().gameName,
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
                  itemCount: getIt<GameController>().lobbyList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 1.0, horizontal: 4.0),
                      child: Card(
                        child: ListTile(
                          onTap: () {},
                          title: Text(getIt<GameController>().lobbyList[index]),
                        ),
                      ),
                    );
                  })
            ])),
          ),
          ...getFooter(),
        ],
      ),
    );
  }

  List<Widget> getFooter() {
    if (getIt<GameController>().isHost) {
      return [
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
      ];
    } else {
      return [
        Expanded(
          flex: 1,
          child: Container(),
        )
      ];
    }
  }

  void _startGame() async {
    // await this.myGC.startGame();
    print("send rpc to start game");
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
