import 'package:schocken_game/widgets/gameManager.dart';
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
    final myInheritedWidget = GameManager.of(context);

    // return empty Container if null
    if (myInheritedWidget.myGameData.activeCupUp == null) {
      return Container();
    }

    bool cupUp = myInheritedWidget.myGameData.activeCupUp;
    Image myCup;
    if (cupUp) {
      myCup = Image.asset('assets/cup_up.png');
    } else {
      myCup = Image.asset('assets/cup_down.png');
    }

    return Container(
      child: GestureDetector(
        onTap: () => myInheritedWidget.cupTouched(cupUp),
        child: myCup,
      ),
      width: widget.width,
      height: widget.height,
    );
  }
}
