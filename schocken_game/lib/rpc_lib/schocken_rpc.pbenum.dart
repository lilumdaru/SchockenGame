///
//  Generated code. Do not modify.
//  source: schocken_rpc.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class PlayerList_state extends $pb.ProtobufEnum {
  static const PlayerList_state LOBBY = PlayerList_state._(0, 'LOBBY');
  static const PlayerList_state STARTING = PlayerList_state._(1, 'STARTING');
  static const PlayerList_state RUNNING = PlayerList_state._(2, 'RUNNING');
  static const PlayerList_state ENDED = PlayerList_state._(3, 'ENDED');
  static const PlayerList_state TIMEOUT = PlayerList_state._(4, 'TIMEOUT');
  static const PlayerList_state ERROR = PlayerList_state._(5, 'ERROR');

  static const $core.List<PlayerList_state> values = <PlayerList_state> [
    LOBBY,
    STARTING,
    RUNNING,
    ENDED,
    TIMEOUT,
    ERROR,
  ];

  static final $core.Map<$core.int, PlayerList_state> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PlayerList_state valueOf($core.int value) => _byValue[value];

  const PlayerList_state._($core.int v, $core.String n) : super(v, n);
}

class RpcGameData_game_state extends $pb.ProtobufEnum {
  static const RpcGameData_game_state LOBBY = RpcGameData_game_state._(0, 'LOBBY');
  static const RpcGameData_game_state STARTING = RpcGameData_game_state._(1, 'STARTING');
  static const RpcGameData_game_state RUNNING = RpcGameData_game_state._(2, 'RUNNING');
  static const RpcGameData_game_state ENDED = RpcGameData_game_state._(3, 'ENDED');
  static const RpcGameData_game_state TIMEOUT = RpcGameData_game_state._(4, 'TIMEOUT');
  static const RpcGameData_game_state ERROR = RpcGameData_game_state._(5, 'ERROR');

  static const $core.List<RpcGameData_game_state> values = <RpcGameData_game_state> [
    LOBBY,
    STARTING,
    RUNNING,
    ENDED,
    TIMEOUT,
    ERROR,
  ];

  static final $core.Map<$core.int, RpcGameData_game_state> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RpcGameData_game_state valueOf($core.int value) => _byValue[value];

  const RpcGameData_game_state._($core.int v, $core.String n) : super(v, n);
}

class RpcGameData_game_round extends $pb.ProtobufEnum {
  static const RpcGameData_game_round ROUND1_FH = RpcGameData_game_round._(0, 'ROUND1_FH');
  static const RpcGameData_game_round ROUND1_BACK = RpcGameData_game_round._(1, 'ROUND1_BACK');
  static const RpcGameData_game_round ROUND2_FH = RpcGameData_game_round._(2, 'ROUND2_FH');
  static const RpcGameData_game_round ROUND2_BACK = RpcGameData_game_round._(3, 'ROUND2_BACK');
  static const RpcGameData_game_round FINALE_FH = RpcGameData_game_round._(4, 'FINALE_FH');
  static const RpcGameData_game_round FINALE_BACK = RpcGameData_game_round._(5, 'FINALE_BACK');

  static const $core.List<RpcGameData_game_round> values = <RpcGameData_game_round> [
    ROUND1_FH,
    ROUND1_BACK,
    ROUND2_FH,
    ROUND2_BACK,
    FINALE_FH,
    FINALE_BACK,
  ];

  static final $core.Map<$core.int, RpcGameData_game_round> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RpcGameData_game_round valueOf($core.int value) => _byValue[value];

  const RpcGameData_game_round._($core.int v, $core.String n) : super(v, n);
}

class RpcPlayer_player_state extends $pb.ProtobufEnum {
  static const RpcPlayer_player_state ACTIVE = RpcPlayer_player_state._(0, 'ACTIVE');
  static const RpcPlayer_player_state PASSIVE = RpcPlayer_player_state._(1, 'PASSIVE');
  static const RpcPlayer_player_state SPEC = RpcPlayer_player_state._(2, 'SPEC');
  static const RpcPlayer_player_state LEFT = RpcPlayer_player_state._(3, 'LEFT');
  static const RpcPlayer_player_state OTHER = RpcPlayer_player_state._(4, 'OTHER');

  static const $core.List<RpcPlayer_player_state> values = <RpcPlayer_player_state> [
    ACTIVE,
    PASSIVE,
    SPEC,
    LEFT,
    OTHER,
  ];

  static final $core.Map<$core.int, RpcPlayer_player_state> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RpcPlayer_player_state valueOf($core.int value) => _byValue[value];

  const RpcPlayer_player_state._($core.int v, $core.String n) : super(v, n);
}

