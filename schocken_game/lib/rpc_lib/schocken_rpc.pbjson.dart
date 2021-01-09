///
//  Generated code. Do not modify.
//  source: schocken_rpc.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const PlayerInfo$json = const {
  '1': 'PlayerInfo',
  '2': const [
    const {'1': 'player_name', '3': 1, '4': 1, '5': 9, '10': 'playerName'},
    const {'1': 'game_name', '3': 2, '4': 1, '5': 9, '10': 'gameName'},
    const {'1': 'player_nr', '3': 3, '4': 1, '5': 5, '10': 'playerNr'},
    const {'1': 'game_nr', '3': 4, '4': 1, '5': 5, '10': 'gameNr'},
  ],
};

const RegistrationResponse$json = const {
  '1': 'RegistrationResponse',
  '2': const [
    const {'1': 'return_value', '3': 1, '4': 1, '5': 5, '10': 'returnValue'},
    const {'1': 'player_nr', '3': 2, '4': 1, '5': 5, '10': 'playerNr'},
    const {'1': 'game_nr', '3': 3, '4': 1, '5': 5, '10': 'gameNr'},
    const {'1': 'error_msg', '3': 4, '4': 1, '5': 9, '10': 'errorMsg'},
  ],
};

const GameID$json = const {
  '1': 'GameID',
  '2': const [
    const {'1': 'game_name', '3': 1, '4': 1, '5': 9, '10': 'gameName'},
    const {'1': 'game_nr', '3': 2, '4': 1, '5': 5, '10': 'gameNr'},
    const {'1': 'error_msg', '3': 3, '4': 1, '5': 9, '10': 'errorMsg'},
  ],
};

const PlayerList$json = const {
  '1': 'PlayerList',
  '2': const [
    const {'1': 'player_names', '3': 1, '4': 3, '5': 9, '10': 'playerNames'},
    const {'1': 'status', '3': 2, '4': 1, '5': 14, '6': '.PlayerList.state', '10': 'status'},
  ],
  '4': const [PlayerList_state$json],
};

const PlayerList_state$json = const {
  '1': 'state',
  '2': const [
    const {'1': 'LOBBY', '2': 0},
    const {'1': 'STARTING', '2': 1},
    const {'1': 'RUNNING', '2': 2},
    const {'1': 'ENDED', '2': 3},
    const {'1': 'TIMEOUT', '2': 4},
    const {'1': 'ERROR', '2': 5},
  ],
};

const Empty$json = const {
  '1': 'Empty',
};

const StartGameResponse$json = const {
  '1': 'StartGameResponse',
  '2': const [
    const {'1': 'return_value', '3': 1, '4': 1, '5': 5, '10': 'returnValue'},
    const {'1': 'error_msg', '3': 2, '4': 1, '5': 9, '10': 'errorMsg'},
  ],
};

const DiceTouched$json = const {
  '1': 'DiceTouched',
  '2': const [
    const {'1': 'dice_id', '3': 1, '4': 1, '5': 5, '10': 'diceId'},
    const {'1': 'player_nr', '3': 2, '4': 1, '5': 5, '10': 'playerNr'},
    const {'1': 'game_nr', '3': 3, '4': 1, '5': 5, '10': 'gameNr'},
    const {'1': 'game_name', '3': 4, '4': 1, '5': 9, '10': 'gameName'},
    const {'1': 'player_name', '3': 5, '4': 1, '5': 9, '10': 'playerName'},
  ],
};

const RpcGameData$json = const {
  '1': 'RpcGameData',
  '2': const [
    const {'1': 'game_name', '3': 1, '4': 1, '5': 9, '10': 'gameName'},
    const {'1': 'players', '3': 2, '4': 3, '5': 11, '6': '.RpcPlayer', '10': 'players'},
    const {'1': 'game_status', '3': 3, '4': 1, '5': 14, '6': '.RpcGameData.game_state', '10': 'gameStatus'},
    const {'1': 'active_player', '3': 4, '4': 1, '5': 11, '6': '.RpcPlayer', '10': 'activePlayer'},
    const {'1': 'active_roll', '3': 5, '4': 1, '5': 5, '10': 'activeRoll'},
    const {'1': 'max_rolls', '3': 6, '4': 1, '5': 5, '10': 'maxRolls'},
    const {'1': 'active_cup_up', '3': 7, '4': 1, '5': 8, '10': 'activeCupUp'},
    const {'1': 'messages', '3': 8, '4': 3, '5': 9, '10': 'messages'},
    const {'1': 'button_turn_6', '3': 9, '4': 1, '5': 8, '10': 'buttonTurn6'},
    const {'1': 'generate_report', '3': 10, '4': 1, '5': 8, '10': 'generateReport'},
    const {'1': 'discs_on_stack', '3': 11, '4': 1, '5': 5, '10': 'discsOnStack'},
    const {'1': 'error_msg', '3': 12, '4': 1, '5': 9, '10': 'errorMsg'},
  ],
  '4': const [RpcGameData_game_state$json],
};

const RpcGameData_game_state$json = const {
  '1': 'game_state',
  '2': const [
    const {'1': 'LOBBY', '2': 0},
    const {'1': 'STARTING', '2': 1},
    const {'1': 'RUNNING', '2': 2},
    const {'1': 'ENDED', '2': 3},
    const {'1': 'TIMEOUT', '2': 4},
    const {'1': 'ERROR', '2': 5},
  ],
};

const RpcPlayer$json = const {
  '1': 'RpcPlayer',
  '2': const [
    const {'1': 'player_name', '3': 1, '4': 1, '5': 9, '10': 'playerName'},
    const {'1': 'player_status', '3': 2, '4': 1, '5': 14, '6': '.RpcPlayer.player_state', '10': 'playerStatus'},
    const {'1': 'harte', '3': 3, '4': 1, '5': 5, '10': 'harte'},
    const {'1': 'dice', '3': 4, '4': 3, '5': 5, '10': 'dice'},
  ],
  '4': const [RpcPlayer_player_state$json],
};

const RpcPlayer_player_state$json = const {
  '1': 'player_state',
  '2': const [
    const {'1': 'ACTIVE', '2': 0},
    const {'1': 'PASSIVE', '2': 1},
    const {'1': 'SPEC', '2': 2},
    const {'1': 'LEFT', '2': 3},
    const {'1': 'OTHER', '2': 4},
  ],
};

