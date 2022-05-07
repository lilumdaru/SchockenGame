import 'package:flutter/material.dart';
import 'package:schocken_game/shared/sharedEnums.dart';
import 'package:schocken_game/widgets/playerCard.dart';
import '../rpc_lib/restConnector.dart';
import '../shared/gameData.dart';
import '../shared/player.dart';

class GameManager extends StatefulWidget {
  final Widget child;
  final int event;
  final RestConnector myGC;
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
  RestConnector myGC;

  // add functions here

  void diceTouched(int id) async {
    print("diceTouched: " + id.toString());

    // GameData newData = await myGC.touchDice(id);
    // updateUi(newData);
  }

  void cupTouched(bool cupState) async {
    print("Cup with " + cupState.toString() + " touched!");

    // GameData newData = await myGC.touchCup();
    // updateUi(newData);
  }

  void endTurn() async {
    print("endTurn!");
    // GameData newData = await myGC.endTurn();
    // updateUi(newData);
  }

  void refresh() async {
    print("refresh!");
    // GameData newData = await myGC.refreshGame();
    // updateUi(newData);

    // if (newData.sendReport) {
    //   showReport(newData);
    // }
  }

  void turnSix() async {
    print("turnSix!");
    // GameData newData = await myGC.turnSix();
    // updateUi(newData);
  }

  void updateUi(GameData newData) {
    if (!mounted) return;

    // GUI Bugfix: fill active Player:
    for (Player player in newData.players) {
      if (player.playerState == PlayerState.ACTIVE) {
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

    if (newData.state == GameState.LOBBY ||
        newData.state == GameState.RUNNING) {
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
      // myGC.setShowdialog(this._showDialog);

      // fill data structure to avoid errors
      myGameData.activePlayer =
          new Player("", PlayerState.ACTIVE, 0, [], false);
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
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.pop(context);
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
