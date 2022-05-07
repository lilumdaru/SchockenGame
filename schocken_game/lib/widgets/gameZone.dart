import 'package:flutter/material.dart';
import 'package:schocken_game/shared/sharedEnums.dart';
import 'package:schocken_game/widgets/turnSixButton.dart';
import '../widgets/dice.dart';
import '../widgets/cup.dart';
import '../widgets/roundCounter.dart';
import '../widgets/gameManager.dart';
import 'discStack.dart';

class GameZone extends StatefulWidget {
  const GameZone({
    Key key,
    @required this.gfWidth,
    @required this.gfHeight,
  }) : super(key: key);

  final double gfWidth;
  final double gfHeight;

  @override
  _GameZoneState createState() => _GameZoneState();
}

class _GameZoneState extends State<GameZone> {
  @override
  Widget build(BuildContext context) {
    final myInheritedWidget = GameManager.of(context);
    Widget gameRound = Container();

    switch (myInheritedWidget.myGameData.gameRound) {
      case GameRound.ROUND1_FH:
        {
          gameRound = Text("R1: H");
        }
        break;
      case GameRound.ROUND1_BACK:
        {
          gameRound = Text("R1: B");
        }
        break;
      case GameRound.ROUND2_FH:
        {
          gameRound = Text("R2: H");
        }
        break;
      case GameRound.ROUND2_BACK:
        {
          gameRound = Text("R2: B");
        }
        break;
      case GameRound.FINALE_FH:
        {
          gameRound = Text("F: H");
        }
        break;
      case GameRound.FINALE_BACK:
        {
          gameRound = Text("F: B");
        }
        break;
    }

    return Container(
        width: widget.gfWidth,
        height: widget.gfHeight,
        child: Stack(children: [
          Positioned(
            top: 0.05 * widget.gfWidth * 0.618,
            left: 0.05 * widget.gfHeight,
            child: Cup(
              height: 0.4 * widget.gfHeight,
              width: 0.4 * widget.gfWidth * 0.618,
              number: 0,
            ),
          ),
          Positioned(
            top: 0.65 * widget.gfHeight,
            left: 0.05 * widget.gfWidth * 0.618,
            child: Dice(
              height: 0.3 * widget.gfHeight,
              width: 0.3 * widget.gfWidth * 0.618,
              index: 1,
            ),
          ),
          Positioned(
            top: 0.6 * widget.gfHeight,
            left: 0.45 * widget.gfWidth * 0.618,
            child: Dice(
              height: 0.3 * widget.gfHeight,
              width: 0.3 * widget.gfWidth * 0.618,
              index: 2,
            ),
          ),
          Positioned(
            top: 0.25 * widget.gfHeight,
            left: 0.6 * widget.gfWidth * 0.618,
            child: Dice(
              height: 0.3 * widget.gfHeight,
              width: 0.3 * widget.gfWidth * 0.618,
              index: 3,
            ),
          ),
          Positioned(
            top: 0.05 * widget.gfHeight,
            right: 0.05 * widget.gfWidth * 0.618,
            child: RoundCounter(
              height: 0.3 * widget.gfHeight,
              width: 0.3 * widget.gfWidth * 0.618,
            ),
          ),
          Positioned(
            top: 0.40 * widget.gfHeight,
            right: 0.05 * widget.gfWidth * 0.618,
            child: DiscStack(
              height: 0.3 * widget.gfHeight,
              width: 0.3 * widget.gfWidth * 0.618,
            ),
          ),
          Positioned(
            top: 0 * widget.gfHeight,
            left: 0.5 * widget.gfWidth * 0.618,
            child: TurnSixButton(
              height: 0.2 * widget.gfHeight,
              width: 0.6 * widget.gfWidth * 0.618,
            ),
          ),
          Positioned(
            bottom: 0 * widget.gfHeight,
            right: 0.5 * widget.gfWidth * 0.618,
            child: gameRound,
          ),
          // Positioned(
          //   bottom: 0.05 * gfHeight,
          //   right: 0.05 * gfWidth * 0.618,
          //   child: Container(
          //       height: 0.4 * gfHeight,
          //       width: 0.4 * gfWidth * 0.618,
          //       color: Colors.deepOrange,
          //       child: Text("Sanduhr")),
          // ),
          Positioned(
            bottom: 0.05 * widget.gfHeight,
            right: 0.05 * widget.gfWidth * 0.618,
            child: Container(
              height: 0.2 * widget.gfHeight,
              width: 0.2 * widget.gfWidth * 0.618,
              // color: Colors.grey[300],
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                // color: Colors.yellow,
                shape: BoxShape.rectangle,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.black,
                  size: 25.0,
                ),
                onPressed: () {
                  // print("next Player");
                  GameManager.of(context).endTurn();
                },
              ),
            ),
          ),
        ]));
  }
}
