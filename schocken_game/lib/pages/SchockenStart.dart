import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SchockenStart extends StatefulWidget {
  @override
  _SchockenStartState createState() => _SchockenStartState();
}

class _SchockenStartState extends State<SchockenStart> {
  String playerName = '';
  var playerNameContr = TextEditingController();
  final formKeyName = GlobalKey<FormState>();
  final formKeyGame = GlobalKey<FormState>();
  String gameName = '';

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
      title: Text('Schocken v.0'),
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
                        RaisedButton(
                          onPressed: () {
                            _submitJoin();
                          },
                          child: Text('Spiel beitreten'),
                          color: Colors.lightBlue,
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
                        RaisedButton(
                          onPressed: () {
                            _submitHost();
                          },
                          child: Text('Spiel erstellen'),
                          color: Colors.lightBlue,
                        ),
                      ],
                    ),
                  ))),
        ));
  }

  void _submitJoin() {
    if (formKeyGame.currentState.validate() &&
        formKeyName.currentState.validate()) {
      formKeyGame.currentState.save();
      formKeyName.currentState.save();
      setPlayerName(playerName);
      Navigator.pushNamed(context, '/lobbyClient', arguments: {
        'playerName': playerName,
        'gameName': gameName,
      });
    }
  }

  void _submitHost() {
    if (formKeyName.currentState.validate()) {
      formKeyName.currentState.save();
      setPlayerName(playerName);
      Navigator.pushNamed(context, '/lobbyHost', arguments: {
        'playerName': playerName,
      });
    }
  }
}
