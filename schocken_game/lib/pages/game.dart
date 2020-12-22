import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../rpc_lib/gameConnector.dart';
import '../shared/gameData.dart';
import '../widgets/gameManager.dart';
import '../widgets/playerList.dart';
import '../widgets/gameZone.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  Map data = {};
  GameConnector myGC;
  GameData myGameData;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    myGC = data["GameConnector"];

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
      body: GameManager(
        myGC: myGC,
        child: Column(
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
      ),
    );
  }
}
