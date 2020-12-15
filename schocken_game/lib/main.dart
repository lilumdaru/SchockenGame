import 'package:flutter/material.dart';
import 'package:schocken_game/pages/SchockenStart.dart';
import 'package:schocken_game/pages/game.dart';
import 'package:schocken_game/pages/lobbyClient.dart';
import 'package:schocken_game/pages/lobbyHost.dart';

void main() {
  runApp(MaterialApp(routes: {
    '/': (context) => SchockenStart(),
    '/lobbyClient': (context) => LobbyClient(),
    '/lobbyHost': (context) => LobbyHost(),
    '/game': (context) => Game(),
  }));
}
