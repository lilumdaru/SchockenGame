import 'package:flutter/material.dart';
import 'package:schocken_game/widgets/gameManager.dart';

class TurnSixButton extends StatefulWidget {
  final double width;
  final double height;

  TurnSixButton({@required this.width, @required this.height});
  @override
  _TurnSixButton createState() => _TurnSixButton();
}

class _TurnSixButton extends State<TurnSixButton> {
  @override
  Widget build(BuildContext context) {
    final myInheritedWidget = GameManager.of(context);

    if (myInheritedWidget.myGameData.turnSixButton == false) {
      return Container();
    }

    Image turnSixImg = Image.asset('assets/turn_six_button.png');

    return Container(
      child: GestureDetector(
        onTap: () => myInheritedWidget.turnSix(),
        child: turnSixImg,
      ),
      width: widget.width,
      height: widget.height,
    );
  }
}
