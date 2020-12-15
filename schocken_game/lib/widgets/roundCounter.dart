import 'package:flutter/material.dart';
import 'package:schocken_game/widgets/gameManager.dart';

class RoundCounter extends StatefulWidget {
  final int x;
  final int y;
  final double width;
  final double height;

  RoundCounter(
      {@required this.x,
      @required this.y,
      @required this.width,
      @required this.height});
  @override
  _RoundCounter createState() => _RoundCounter();
}

class _RoundCounter extends State<RoundCounter> {
  @override
  Widget build(BuildContext context) {
    final myInheritedWidget = GameManager.of(context);

    if (myInheritedWidget.myGameData.activeRoll == null ||
        myInheritedWidget.myGameData.maxRolls == null) {
      return Container();
    }

    int x = myInheritedWidget.myGameData.activeRoll;
    int y = myInheritedWidget.myGameData.maxRolls;
    if (x == 0) {
      x = 1;
    }
    Image myRoundCounter = Image.asset(
        'assets/round_counter_' + x.toString() + '_' + y.toString() + '.png');

    return Container(
      child: GestureDetector(
        onTap: () => print("RoundCounter with " +
            x.toString() +
            "/" +
            y.toString() +
            " touched!"),
        child: myRoundCounter,
      ),
      width: widget.width,
      height: widget.height,
      color: Colors.amber[200],
    );
  }
}
