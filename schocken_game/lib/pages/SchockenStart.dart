import 'package:flutter/material.dart';
import 'package:schocken_game/shared/functionReturnValues.dart';
import 'package:schocken_game/shared/gameController.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

class SchockenStart extends StatefulWidget {
  @override
  _SchockenStartState createState() => _SchockenStartState();
}

class _SchockenStartState extends State<SchockenStart> {
  String playerName = '';
  String gameName = '';
  var playerNameContr = TextEditingController();
  final formKeyName = GlobalKey<FormState>();
  final formKeyGame = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Call Playername from sharedPrefs
    loadPlayerName();
  }

  /// save the name
  Future<void> setPlayerName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('Playername', name);
  }

  /// get set last used Name
  /// use setState to display in the UI
  Future<void> loadPlayerName() async {
    final prefs = await SharedPreferences.getInstance();
    final String name = prefs.getString('Playername');

    if (name != null) {
      setState(() => playerNameContr.text = name);
    }
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text('Schocken v.0.1'),
      centerTitle: true,
    );
    double screenHeightMinusAppBarMinusStatusBar =
        MediaQuery.of(context).size.height -
            appBar.preferredSize.height -
            MediaQuery.of(context).padding.top;

    return Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: screenHeightMinusAppBarMinusStatusBar),
              //constraints: BoxConstraints(),
              child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                  },
                  child: Padding(
                    padding: EdgeInsets.all(40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Wer spielt?'),
                        Expanded(
                          flex: 3,
                          child: Container(),
                        ),
                        Form(
                          key: formKeyName,
                          child: TextFormField(
                            controller: playerNameContr,
                            onSaved: (input) => playerName = input,
                            onChanged: (String value) async {
                              formKeyName.currentState.validate();
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Not a valid player name';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Name',
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(),
                        ),
                        Divider(
                          height: 20.0,
                          color: Colors.grey,
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(),
                        ),
                        Text('Spiel beitreten'),
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        Form(
                          key: formKeyGame,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Spielname',
                            ),
                            onChanged: (String value) async {
                              formKeyGame.currentState.validate();
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Not a valid game name';
                              }
                              return null;
                            },
                            onSaved: (input) => gameName = input,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.lightBlue,
                            elevation: 3,
                          ),
                          onPressed: () {
                            _submitJoin();
                          },
                          child: Text(
                            'Spiel beitreten',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(),
                        ),
                        Divider(
                          height: 20.0,
                          color: Colors.grey,
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(),
                        ),
                        Text('Spiel erstellen'),
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.lightBlue,
                            elevation: 3,
                          ),
                          onPressed: () {
                            _submitHost();
                          },
                          child: Text(
                            'Spiel erstellen',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
        ));
  }

  void _submitJoin() {
    getIt<GameController>().isHost = false;

    if (formKeyGame.currentState.validate() &&
        formKeyName.currentState.validate()) {
      formKeyGame.currentState.save();
      formKeyName.currentState.save();
      setPlayerName(playerName);

      getIt<GameController>()
          .registerPlayer(this.playerName, this.gameName)
          .then((fncReturn) => {
                if (fncReturn == ReturnValue.SUCCESS)
                  {Navigator.pushNamed(context, '/lobby')}
              });
    }
  }

  void _submitHost() {
    getIt<GameController>().isHost = true;

    if (formKeyName.currentState.validate()) {
      formKeyName.currentState.save();
      setPlayerName(playerName);

      getIt<GameController>()
          .registerGame(this.playerName)
          .then((fncReturn) => {
                if (fncReturn == ReturnValue.SUCCESS)
                  {Navigator.pushNamed(context, '/lobby')}
              });
    }
  }
}
