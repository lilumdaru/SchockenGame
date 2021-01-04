import 'package:flutter/material.dart';
import 'package:schocken_game/widgets/gameManager.dart';

class DiscStack extends StatefulWidget {
  final double width;
  final double height;

  DiscStack({@required this.width, @required this.height});
  @override
  _DiscStack createState() => _DiscStack();
}

class _DiscStack extends State<DiscStack> {
  @override
  Widget build(BuildContext context) {
    final myInheritedWidget = GameManager.of(context);

    if (myInheritedWidget.myGameData.discsOnStack == null) {
      return Container();
    }

    int discsOnStack = myInheritedWidget.myGameData.discsOnStack;

    return Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage('assets/stack.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          discsOnStack.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      width: widget.width,
      height: widget.height,
    );
  }
}
