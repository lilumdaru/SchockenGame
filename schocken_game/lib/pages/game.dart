import 'package:flutter/material.dart';
import 'package:schocken_game/shared/gameController.dart';
import 'package:schocken_game/shared/gameData.dart';
import 'package:schocken_game/widgets/gameZone.dart';
import 'package:schocken_game/widgets/playerCard.dart';
import 'package:schocken_game/widgets/playerList.dart';
import '../main.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  GameData myGameData;

  @override
  void initState() {
    super.initState();
    getIt<GameController>().addListener(update);
  }

  @override
  void dispose() {
    getIt<GameController>().removeListener(update);
    super.dispose();
  }

  void update() {
    if (!mounted) return;

    if (getIt<GameController>().ErrorMsg != "") {
      print("Error! _showDialog" + getIt<GameController>().ErrorMsg);
      this._showDialog("Error", getIt<GameController>().ErrorMsg, "OK");
      getIt<GameController>().ErrorMsg = ""; // reset error
    } else {
      setState(() => {});
    }

    GameData gameData = getIt<GameController>().gameData;
    if (gameData.sendReport) {
      this.showReport(gameData);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    AppBar appBar = AppBar(
      title: Text('Schocken v.0'),
      centerTitle: true,
      automaticallyImplyLeading: true,
    );
    double screenHeightMinusAppBarMinusStatusBar =
        MediaQuery.of(context).size.height -
            appBar.preferredSize.height -
            MediaQuery.of(context).padding.top;
    double playerHeight =
        screenHeightMinusAppBarMinusStatusBar - 20 - width * 0.618;

    // gameField:
    double gfWidth = width;
    double gfHeight = width * 0.618;

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: <Widget>[
          SizedBox(height: 10.0),
          ConstrainedBox(
            constraints: new BoxConstraints(
              maxHeight: playerHeight,
            ),
            child: PlayerList(),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Divider(
            height: 10.0,
            color: Colors.grey,
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
          GameZone(gfWidth: gfWidth, gfHeight: gfHeight),
          Expanded(
            flex: 1,
            child: Container(),
          ),
        ],
      ),
    );
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

  void showReport(GameData newData) {
    Widget contentData = Scrollbar(
        child: SingleChildScrollView(
            child: Column(children: <Widget>[
      ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: newData.messages.length,
          itemBuilder: (context, index2) {
            return Card(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(child: Text(newData.messages[index2]))),
            );
          }),
      ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: newData.players.length,
          itemBuilder: (context, index) {
            return PlayerCard(index: index, myGameData: newData);
          })
    ])));

    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Ergebnisse"),
          content: contentData,
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlue,
                elevation: 3,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'OK',
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
