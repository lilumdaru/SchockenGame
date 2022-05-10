import 'package:flutter/material.dart';
import 'package:schocken_game/main.dart';
import 'package:schocken_game/shared/gameController.dart';
import 'package:schocken_game/shared/gameData.dart';

class RoundCounter extends StatefulWidget {
  final double width;
  final double height;

  RoundCounter({@required this.width, @required this.height});
  @override
  _RoundCounter createState() => _RoundCounter();
}

class _RoundCounter extends State<RoundCounter> {
  @override
  Widget build(BuildContext context) {
    GameData gameData = getIt<GameController>().gameData;

    if (gameData.activeRoll == null || gameData.maxRolls == null) {
      return Container();
    }

    int x = gameData.activeRoll;
    int y = gameData.maxRolls;
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
    );
  }
}
