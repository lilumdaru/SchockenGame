import 'package:flutter/material.dart';
import '../rpc_lib/gameConnector.dart';
import '../shared/gameData.dart';
import '../shared/player.dart';

class GameManager extends StatefulWidget {
  final Widget child;
  final int event;
  final GameConnector myGC;
  final GameData myGameData;

  GameManager({@required this.child, this.event, this.myGC, this.myGameData});

  static GameManagerState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedContainer>()
        .data;
  }

// final widget = context.inheritFromWidgetOfExactType(InheritedContainer) as InheritedContainer;
// final widget = context.dependOnInheritedWidgetOfExactType<InheritedContainer>();

  GameManagerState createState() => GameManagerState();
}

class GameManagerState extends State<GameManager> {
  int event = 0;
  bool firstRun = true;
  GameData myGameData = new GameData();
  GameConnector myGC;

  // add functions here

  void diceTouched(int id) async {
    print("diceTouched: " + id.toString());

    GameData newData = await myGC.touchDice(id);
    updateUi(newData);
  }

  void cupTouched(bool cupState) async {
    print("Cup with " + cupState.toString() + " touched!");

    GameData newData = await myGC.touchCup();
    updateUi(newData);
  }

  void endTurn() async {
    print("endTurn!");
    GameData newData = await myGC.endTurn();
    updateUi(newData);
  }

  void refresh() async {
    print("refresh!");
    GameData newData = await myGC.refreshGame();
    updateUi(newData);
  }

  void updateUi(GameData newData) {
    if (!mounted) return;

    // GUI Bugfix: fill active Player:
    for (Player player in newData.players) {
      if (player.playerState == playerStatus.ACTIVE) {
        newData.activePlayer = player;
        break;
      }
    }

    // GUI Bugfix: set Active Player Cup Status:
    bool cupUp = true;
    for (int i = 0; i < newData.activePlayer.dice.length; i++) {
      if (newData.activePlayer.dice[i] < 1 ||
          newData.activePlayer.dice[i] > 6) {
        cupUp = false;
      }
    }
    if (newData.activePlayer.dice.length < 3) {
      cupUp = false;
    }
    newData.activeCupUp = cupUp;

    if (newData.state == gameStatus.LOBBY ||
        newData.state == gameStatus.RUNNING) {
      setState(() {
        myGameData = newData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // init myGameData
    if (firstRun) {
      myGC = widget.myGC;
      myGC.setShowdialog(this._showDialog);
      // myGameData.players.add(new Player("name1", playerStatus.ACTIVE, 5, []));
      // myGameData.players
      //     .add(new Player("name2", playerStatus.PASSIVE, 13, [1, 1]));
      // myGameData.players.add(new Player("name3", playerStatus.LEFT, 2, [2]));
      // myGameData.players
      //     .add(new Player("name4", playerStatus.PASSIVE, 0, [2, 2, 2]));

      myGameData.activePlayer =
          new Player("name4", playerStatus.SPEC, 6, [0, 0]);
      myGameData.activeCupUp = true;
      firstRun = false;
    }

    return InheritedContainer(
      data: this,
      child: widget.child,
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

class InheritedContainer extends InheritedWidget {
  final GameManagerState data;

  InheritedContainer({Key key, @required this.data, @required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedContainer oldWidget) {
    return true;
  }
}
