import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:schocken_game/pages/schockenStart.dart';
import 'package:schocken_game/pages/game.dart';
import 'package:schocken_game/pages/lobby.dart';
import 'package:schocken_game/shared/gameController.dart';

final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<GameController>(GameController());

  runApp(MaterialApp(routes: {
    '/': (context) => SchockenStart(),
    '/lobby': (context) => Lobby(),
    '/game': (context) => Game(),
  }));
}
