import 'package:schocken_game/main.dart';
import 'package:schocken_game/shared/gameController.dart';
import 'package:schocken_game/shared/gameData.dart';
import 'package:flutter/material.dart';

class Cup extends StatefulWidget {
  final int number;
  final double width;
  final double height;

  Cup({@required this.number, @required this.width, @required this.height});
  @override
  _Cup createState() => _Cup();
}

class _Cup extends State<Cup> {
  @override
  Widget build(BuildContext context) {
    GameData gameData = getIt<GameController>().gameData;

    // return empty Container if null
    if (gameData.activeCupUp == null) {
      return Container();
    }

    bool cupUp = gameData.activeCupUp;
    Image myCup;
    if (cupUp) {
      myCup = Image.asset('assets/cup_up.png');
    } else {
      myCup = Image.asset('assets/cup_down.png');
    }

    return Container(
      child: GestureDetector(
        onTap: () => getIt<GameController>().touchCup(),
        child: myCup,
      ),
      width: widget.width,
      height: widget.height,
    );
  }
}
