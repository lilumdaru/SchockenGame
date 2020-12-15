import 'package:schocken_game/widgets/gameManager.dart';
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
    final myInheritedWidget = GameManager.of(context);

    // If index is out of array range: Break from function
    if (myInheritedWidget.myGameData.activePlayer.dice.length < widget.index) {
      return Container();
    }

    int diceValue =
        myInheritedWidget.myGameData.activePlayer.dice[widget.index - 1];

    return Container(
      color: Colors.white,
      child: GestureDetector(
        onTap: () => myInheritedWidget.diceTouched(widget.index - 1),
        // print("dice with " + widget.number.toString() + " touched!"),
        child: Image.asset('assets/' + diceValue.toString() + '.png'),
      ),
      width: widget.width,
      height: widget.height,
    );
  }
}
