import 'package:flutter/material.dart';
import '../widgets/playerCard.dart';
import '../widgets/gameManager.dart';
import 'dart:async';

class PlayerList extends StatefulWidget {
  // const PlayerList({
  //   Key key,
  //   @required this.myGameData,
  // }) : super(key: key);

  // final GameData myGameData;

  @override
  _PlayerListState createState() => _PlayerListState();
}

class _PlayerListState extends State<PlayerList> {
  Timer timer;
  int refreshIntervall = 500; // ms
  bool init = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final myInheritedWidget = GameManager.of(context);
    if (init) {
      timer = Timer.periodic(Duration(milliseconds: refreshIntervall),
          (Timer t) => myInheritedWidget.refresh());
      init = false;
    }

    return Scrollbar(
        child: SingleChildScrollView(
            child: Column(children: <Widget>[
      ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: myInheritedWidget.myGameData.players.length,
          itemBuilder: (context, index) {
            return PlayerCard(
                index: index, myGameData: myInheritedWidget.myGameData);
          })
    ])));
  }
}
