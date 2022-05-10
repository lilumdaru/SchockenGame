import 'package:flutter/material.dart';
import 'package:schocken_game/main.dart';
import 'package:schocken_game/shared/gameController.dart';
import 'package:schocken_game/shared/gameData.dart';

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
    GameData gameData = getIt<GameController>().gameData;

    if (gameData.turnSixButton == false) {
      return Container();
    }

    Image turnSixImg = Image.asset('assets/turn_six_button.png');

    return Container(
      child: GestureDetector(
        onTap: () => getIt<GameController>().turnSix(),
        child: turnSixImg,
      ),
      width: widget.width,
      height: widget.height,
    );
  }
}
