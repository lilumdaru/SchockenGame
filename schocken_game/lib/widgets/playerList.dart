import 'package:flutter/material.dart';
import 'package:schocken_game/main.dart';
import 'package:schocken_game/shared/gameController.dart';
import 'package:schocken_game/shared/gameData.dart';
import '../widgets/playerCard.dart';

class PlayerList extends StatefulWidget {
  @override
  _PlayerListState createState() => _PlayerListState();
}

class _PlayerListState extends State<PlayerList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GameData gameData = getIt<GameController>().gameData;

    return Scrollbar(
        child: SingleChildScrollView(
            child: Column(children: <Widget>[
      ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: gameData.players.length,
          itemBuilder: (context, index) {
            return PlayerCard(index: index, myGameData: gameData);
          })
    ])));
  }
}
