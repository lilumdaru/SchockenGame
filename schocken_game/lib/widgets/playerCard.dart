import 'package:flutter/material.dart';
import '../shared/gameData.dart';
import '../shared/player.dart';

class PlayerCard extends StatefulWidget {
  final int index;
  final GameData myGameData;

  PlayerCard({@required this.index, @required this.myGameData});
  @override
  _PlayerCard createState() => _PlayerCard();
}

class _PlayerCard extends State<PlayerCard> {
  @override
  Widget build(BuildContext context) {
    final GameData myGameData = widget.myGameData;
    final int index = widget.index;

    // Build dices and cup display
    List<Widget> dices = [];
    bool cupUp = true;
    for (int i = 0; i < myGameData.players[index].dice.length; i++) {
      if (myGameData.players[index].dice[i] < 1 ||
          myGameData.players[index].dice[i] > 6) {
        cupUp = false;
      }
    }
    if (myGameData.players[index].dice.length < 3) {
      cupUp = false;
    }

    if (cupUp) {
      dices.add(Image.asset(
        'assets/cup_up.png',
        width: 25,
        height: 25,
      ));
    } else {
      dices.add(Image.asset(
        'assets/cup_down.png',
        width: 25,
        height: 25,
      ));
    }

    for (int i = 0; i < myGameData.players[index].dice.length; i++) {
      // print("name: " + myGameData.players[index].playerName);
      // print("Run: " + i.toString());
      // print("myGameData.players[index].dice.length: " +
      //     myGameData.players[index].dice.length.toString());

      if (myGameData.players[index].dice[i] >= 1 &&
          myGameData.players[index].dice[i] <= 6) {
        dices.add(Image.asset(
          'assets/' + myGameData.players[index].dice[i].toString() + '.png',
          width: 25,
          height: 25,
        ));
      }

      if (i == 2) {
        break;
      }
    }

    Widget dicesElement = Container(
      height: 25,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: dices.length,
          itemBuilder: (context, index) {
            return dices[index];
          }),
    );

    Widget lostHalf;
    if (myGameData.players[index].lostHalf) {
      lostHalf = Image.asset(
        'assets/losthalf.png',
        width: 20,
        height: 20,
      );
    } else {
      lostHalf = new Container();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(myGameData.players[index].playerName),
                  Text(myGameData.players[index].harte.toString()),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(width: 1.0),
                  dicesElement,
                  lostHalf,
                ],
              ),
            ],
          ),
        ),
        color: myGameData.players[index].playerState == playerStatus.ACTIVE
            ? Colors.white
            : Colors.grey[300],
      ),
    );
  }
}
