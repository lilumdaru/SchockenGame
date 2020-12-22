import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/dice.dart';
import '../widgets/cup.dart';
import '../widgets/roundCounter.dart';
import '../widgets/gameManager.dart';

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
            top: 0.2 * widget.gfHeight,
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
              height: 0.4 * widget.gfHeight,
              width: 0.4 * widget.gfWidth * 0.618,
              x: 1,
              y: 1,
            ),
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