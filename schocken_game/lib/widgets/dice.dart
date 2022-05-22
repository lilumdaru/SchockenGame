import 'package:schocken_game/main.dart';
import 'package:schocken_game/shared/gameController.dart';
import 'package:schocken_game/shared/gameData.dart';
import 'package:flutter/material.dart';

class Dice extends StatefulWidget {
  final int index;
  final double width;
  final double height;

  Dice({@required this.index, @required this.width, @required this.height});
  @override
  _Dice createState() => _Dice();
}

class _Dice extends State<Dice> {
  @override
  Widget build(BuildContext context) {
    GameData gameData = getIt<GameController>().gameData;

    // If index is out of array range: Break from function
    if (gameData.activePlayer.dice.length < widget.index) {
      return Container();
    }

    int diceValue = gameData.activePlayer.dice[widget.index - 1];

    if (diceValue == 0) {
      //  0 is a place holder for a touched dice
      return Container();
    }

    return Container(
      child: GestureDetector(
        onTap: () => getIt<GameController>().touchDice(widget.index - 1),
        child: Image.asset('assets/' + diceValue.toString() + '.png'),
      ),
      width: widget.width,
      height: widget.height,
    );
  }
}
