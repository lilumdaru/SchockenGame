import 'package:flutter/material.dart';
import 'package:schocken_game/shared/gameController.dart';
import 'package:schocken_game/shared/sharedEnums.dart';
import '../main.dart';

class Lobby extends StatefulWidget {
  @override
  _LobbyState createState() => _LobbyState();
}

class _LobbyState extends State<Lobby> {
  @override
  void initState() {
    super.initState();
    getIt<GameController>().addListener(updateLobby);
  }

  @override
  void dispose() {
    getIt<GameController>().removeListener(updateLobby);
    super.dispose();
  }

  void updateLobby() {
    if (!mounted) return;

    if (getIt<GameController>().ErrorMsg != "") {
      this._showDialog("Error", getIt<GameController>().ErrorMsg, "OK");
      getIt<GameController>().ErrorMsg = ""; // reset error
    }

    if (getIt<GameController>().state == GameState.STARTING) {
      Navigator.pushReplacementNamed(context, '/game');
    } else {
      setState(() => {});
    }
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

    List<String> players = getIt<GameController>().lobbyList;

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
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.lightBlue,
              elevation: 3,
              padding:
                  const EdgeInsets.symmetric(vertical: 2.0, horizontal: 50.0)),
          onPressed: () {
            getIt<GameController>().startGame();
          },
          child: Text(
            'Spiel starten',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlue,
                elevation: 3,
              ),
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text(
                btnText,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
