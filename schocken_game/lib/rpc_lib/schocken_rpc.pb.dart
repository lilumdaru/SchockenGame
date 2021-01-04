///
//  Generated code. Do not modify.
//  source: schocken_rpc.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'schocken_rpc.pbenum.dart';

export 'schocken_rpc.pbenum.dart';

class PlayerInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PlayerInfo', createEmptyInstance: create)
    ..aOS(1, 'playerName')
    ..aOS(2, 'gameName')
    ..a<$core.int>(3, 'playerNr', $pb.PbFieldType.O3)
    ..a<$core.int>(4, 'gameNr', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  PlayerInfo._() : super();
  factory PlayerInfo() => create();
  factory PlayerInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PlayerInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  PlayerInfo clone() => PlayerInfo()..mergeFromMessage(this);
  PlayerInfo copyWith(void Function(PlayerInfo) updates) => super.copyWith((message) => updates(message as PlayerInfo));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PlayerInfo create() => PlayerInfo._();
  PlayerInfo createEmptyInstance() => create();
  static $pb.PbList<PlayerInfo> createRepeated() => $pb.PbList<PlayerInfo>();
  @$core.pragma('dart2js:noInline')
  static PlayerInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlayerInfo>(create);
  static PlayerInfo _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playerName => $_getSZ(0);
  @$pb.TagNumber(1)
  set playerName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerName() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get gameName => $_getSZ(1);
  @$pb.TagNumber(2)
  set gameName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGameName() => $_has(1);
  @$pb.TagNumber(2)
  void clearGameName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get playerNr => $_getIZ(2);
  @$pb.TagNumber(3)
  set playerNr($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPlayerNr() => $_has(2);
  @$pb.TagNumber(3)
  void clearPlayerNr() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get gameNr => $_getIZ(3);
  @$pb.TagNumber(4)
  set gameNr($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasGameNr() => $_has(3);
  @$pb.TagNumber(4)
  void clearGameNr() => clearField(4);
}

class RegistrationResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RegistrationResponse', createEmptyInstance: create)
    ..a<$core.int>(1, 'returnValue', $pb.PbFieldType.O3)
    ..a<$core.int>(2, 'playerNr', $pb.PbFieldType.O3)
    ..a<$core.int>(3, 'gameNr', $pb.PbFieldType.O3)
    ..aOS(4, 'errorMsg')
    ..hasRequiredFields = false
  ;

  RegistrationResponse._() : super();
  factory RegistrationResponse() => create();
  factory RegistrationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegistrationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RegistrationResponse clone() => RegistrationResponse()..mergeFromMessage(this);
  RegistrationResponse copyWith(void Function(RegistrationResponse) updates) => super.copyWith((message) => updates(message as RegistrationResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RegistrationResponse create() => RegistrationResponse._();
  RegistrationResponse createEmptyInstance() => create();
  static $pb.PbList<RegistrationResponse> createRepeated() => $pb.PbList<RegistrationResponse>();
  @$core.pragma('dart2js:noInline')
  static RegistrationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegistrationResponse>(create);
  static RegistrationResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get returnValue => $_getIZ(0);
  @$pb.TagNumber(1)
  set returnValue($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasReturnValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearReturnValue() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get playerNr => $_getIZ(1);
  @$pb.TagNumber(2)
  set playerNr($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPlayerNr() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlayerNr() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get gameNr => $_getIZ(2);
  @$pb.TagNumber(3)
  set gameNr($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasGameNr() => $_has(2);
  @$pb.TagNumber(3)
  void clearGameNr() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get errorMsg => $_getSZ(3);
  @$pb.TagNumber(4)
  set errorMsg($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasErrorMsg() => $_has(3);
  @$pb.TagNumber(4)
  void clearErrorMsg() => clearField(4);
}

class GameID extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GameID', createEmptyInstance: create)
    ..aOS(1, 'gameName')
    ..a<$core.int>(2, 'gameNr', $pb.PbFieldType.O3)
    ..aOS(3, 'errorMsg')
    ..hasRequiredFields = false
  ;

  GameID._() : super();
  factory GameID() => create();
  factory GameID.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GameID.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GameID clone() => GameID()..mergeFromMessage(this);
  GameID copyWith(void Function(GameID) updates) => super.copyWith((message) => updates(message as GameID));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GameID create() => GameID._();
  GameID createEmptyInstance() => create();
  static $pb.PbList<GameID> createRepeated() => $pb.PbList<GameID>();
  @$core.pragma('dart2js:noInline')
  static GameID getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GameID>(create);
  static GameID _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get gameName => $_getSZ(0);
  @$pb.TagNumber(1)
  set gameName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGameName() => $_has(0);
  @$pb.TagNumber(1)
  void clearGameName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get gameNr => $_getIZ(1);
  @$pb.TagNumber(2)
  set gameNr($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGameNr() => $_has(1);
  @$pb.TagNumber(2)
  void clearGameNr() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get errorMsg => $_getSZ(2);
  @$pb.TagNumber(3)
  set errorMsg($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasErrorMsg() => $_has(2);
  @$pb.TagNumber(3)
  void clearErrorMsg() => clearField(3);
}

class PlayerList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PlayerList', createEmptyInstance: create)
    ..pPS(1, 'playerNames')
    ..e<PlayerList_state>(2, 'status', $pb.PbFieldType.OE, defaultOrMaker: PlayerList_state.LOBBY, valueOf: PlayerList_state.valueOf, enumValues: PlayerList_state.values)
    ..hasRequiredFields = false
  ;

  PlayerList._() : super();
  factory PlayerList() => create();
  factory PlayerList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PlayerList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  PlayerList clone() => PlayerList()..mergeFromMessage(this);
  PlayerList copyWith(void Function(PlayerList) updates) => super.copyWith((message) => updates(message as PlayerList));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PlayerList create() => PlayerList._();
  PlayerList createEmptyInstance() => create();
  static $pb.PbList<PlayerList> createRepeated() => $pb.PbList<PlayerList>();
  @$core.pragma('dart2js:noInline')
  static PlayerList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlayerList>(create);
  static PlayerList _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get playerNames => $_getList(0);

  @$pb.TagNumber(2)
  PlayerList_state get status => $_getN(1);
  @$pb.TagNumber(2)
  set status(PlayerList_state v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);
}

class Empty extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Empty', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  Empty._() : super();
  factory Empty() => create();
  factory Empty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Empty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Empty clone() => Empty()..mergeFromMessage(this);
  Empty copyWith(void Function(Empty) updates) => super.copyWith((message) => updates(message as Empty));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty _defaultInstance;
}

class StartGameResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('StartGameResponse', createEmptyInstance: create)
    ..a<$core.int>(1, 'returnValue', $pb.PbFieldType.O3)
    ..aOS(2, 'errorMsg')
    ..hasRequiredFields = false
  ;

  StartGameResponse._() : super();
  factory StartGameResponse() => create();
  factory StartGameResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StartGameResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  StartGameResponse clone() => StartGameResponse()..mergeFromMessage(this);
  StartGameResponse copyWith(void Function(StartGameResponse) updates) => super.copyWith((message) => updates(message as StartGameResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StartGameResponse create() => StartGameResponse._();
  StartGameResponse createEmptyInstance() => create();
  static $pb.PbList<StartGameResponse> createRepeated() => $pb.PbList<StartGameResponse>();
  @$core.pragma('dart2js:noInline')
  static StartGameResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StartGameResponse>(create);
  static StartGameResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get returnValue => $_getIZ(0);
  @$pb.TagNumber(1)
  set returnValue($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasReturnValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearReturnValue() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get errorMsg => $_getSZ(1);
  @$pb.TagNumber(2)
  set errorMsg($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasErrorMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrorMsg() => clearField(2);
}

class DiceTouched extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DiceTouched', createEmptyInstance: create)
    ..a<$core.int>(1, 'diceId', $pb.PbFieldType.O3)
    ..a<$core.int>(2, 'playerNr', $pb.PbFieldType.O3)
    ..a<$core.int>(3, 'gameNr', $pb.PbFieldType.O3)
    ..aOS(4, 'gameName')
    ..aOS(5, 'playerName')
    ..hasRequiredFields = false
  ;

  DiceTouched._() : super();
  factory DiceTouched() => create();
  factory DiceTouched.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DiceTouched.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DiceTouched clone() => DiceTouched()..mergeFromMessage(this);
  DiceTouched copyWith(void Function(DiceTouched) updates) => super.copyWith((message) => updates(message as DiceTouched));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DiceTouched create() => DiceTouched._();
  DiceTouched createEmptyInstance() => create();
  static $pb.PbList<DiceTouched> createRepeated() => $pb.PbList<DiceTouched>();
  @$core.pragma('dart2js:noInline')
  static DiceTouched getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DiceTouched>(create);
  static DiceTouched _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get diceId => $_getIZ(0);
  @$pb.TagNumber(1)
  set diceId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDiceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDiceId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get playerNr => $_getIZ(1);
  @$pb.TagNumber(2)
  set playerNr($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPlayerNr() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlayerNr() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get gameNr => $_getIZ(2);
  @$pb.TagNumber(3)
  set gameNr($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasGameNr() => $_has(2);
  @$pb.TagNumber(3)
  void clearGameNr() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get gameName => $_getSZ(3);
  @$pb.TagNumber(4)
  set gameName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasGameName() => $_has(3);
  @$pb.TagNumber(4)
  void clearGameName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get playerName => $_getSZ(4);
  @$pb.TagNumber(5)
  set playerName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPlayerName() => $_has(4);
  @$pb.TagNumber(5)
  void clearPlayerName() => clearField(5);
}

class RpcGameData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RpcGameData', createEmptyInstance: create)
    ..aOS(1, 'gameName')
    ..pc<RpcPlayer>(2, 'players', $pb.PbFieldType.PM, subBuilder: RpcPlayer.create)
    ..e<RpcGameData_game_state>(3, 'gameStatus', $pb.PbFieldType.OE, defaultOrMaker: RpcGameData_game_state.LOBBY, valueOf: RpcGameData_game_state.valueOf, enumValues: RpcGameData_game_state.values)
    ..aOM<RpcPlayer>(4, 'activePlayer', subBuilder: RpcPlayer.create)
    ..a<$core.int>(5, 'activeRoll', $pb.PbFieldType.O3)
    ..a<$core.int>(6, 'maxRolls', $pb.PbFieldType.O3)
    ..aOB(7, 'activeCupUp')
    ..aOS(8, 'message')
    ..aOB(9, 'buttonTurn6', protoName: 'button_turn_6')
    ..aOB(10, 'generateReport')
    ..a<$core.int>(11, 'discsOnStack', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  RpcGameData._() : super();
  factory RpcGameData() => create();
  factory RpcGameData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RpcGameData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RpcGameData clone() => RpcGameData()..mergeFromMessage(this);
  RpcGameData copyWith(void Function(RpcGameData) updates) => super.copyWith((message) => updates(message as RpcGameData));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RpcGameData create() => RpcGameData._();
  RpcGameData createEmptyInstance() => create();
  static $pb.PbList<RpcGameData> createRepeated() => $pb.PbList<RpcGameData>();
  @$core.pragma('dart2js:noInline')
  static RpcGameData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RpcGameData>(create);
  static RpcGameData _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get gameName => $_getSZ(0);
  @$pb.TagNumber(1)
  set gameName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGameName() => $_has(0);
  @$pb.TagNumber(1)
  void clearGameName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<RpcPlayer> get players => $_getList(1);

  @$pb.TagNumber(3)
  RpcGameData_game_state get gameStatus => $_getN(2);
  @$pb.TagNumber(3)
  set gameStatus(RpcGameData_game_state v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasGameStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearGameStatus() => clearField(3);

  @$pb.TagNumber(4)
  RpcPlayer get activePlayer => $_getN(3);
  @$pb.TagNumber(4)
  set activePlayer(RpcPlayer v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasActivePlayer() => $_has(3);
  @$pb.TagNumber(4)
  void clearActivePlayer() => clearField(4);
  @$pb.TagNumber(4)
  RpcPlayer ensureActivePlayer() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.int get activeRoll => $_getIZ(4);
  @$pb.TagNumber(5)
  set activeRoll($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasActiveRoll() => $_has(4);
  @$pb.TagNumber(5)
  void clearActiveRoll() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get maxRolls => $_getIZ(5);
  @$pb.TagNumber(6)
  set maxRolls($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMaxRolls() => $_has(5);
  @$pb.TagNumber(6)
  void clearMaxRolls() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get activeCupUp => $_getBF(6);
  @$pb.TagNumber(7)
  set activeCupUp($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasActiveCupUp() => $_has(6);
  @$pb.TagNumber(7)
  void clearActiveCupUp() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get message => $_getSZ(7);
  @$pb.TagNumber(8)
  set message($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasMessage() => $_has(7);
  @$pb.TagNumber(8)
  void clearMessage() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get buttonTurn6 => $_getBF(8);
  @$pb.TagNumber(9)
  set buttonTurn6($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasButtonTurn6() => $_has(8);
  @$pb.TagNumber(9)
  void clearButtonTurn6() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get generateReport => $_getBF(9);
  @$pb.TagNumber(10)
  set generateReport($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasGenerateReport() => $_has(9);
  @$pb.TagNumber(10)
  void clearGenerateReport() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get discsOnStack => $_getIZ(10);
  @$pb.TagNumber(11)
  set discsOnStack($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasDiscsOnStack() => $_has(10);
  @$pb.TagNumber(11)
  void clearDiscsOnStack() => clearField(11);
}

class RpcPlayer extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RpcPlayer', createEmptyInstance: create)
    ..aOS(1, 'playerName')
    ..e<RpcPlayer_player_state>(2, 'playerStatus', $pb.PbFieldType.OE, defaultOrMaker: RpcPlayer_player_state.ACTIVE, valueOf: RpcPlayer_player_state.valueOf, enumValues: RpcPlayer_player_state.values)
    ..a<$core.int>(3, 'harte', $pb.PbFieldType.O3)
    ..p<$core.int>(4, 'dice', $pb.PbFieldType.P3)
    ..hasRequiredFields = false
  ;

  RpcPlayer._() : super();
  factory RpcPlayer() => create();
  factory RpcPlayer.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RpcPlayer.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RpcPlayer clone() => RpcPlayer()..mergeFromMessage(this);
  RpcPlayer copyWith(void Function(RpcPlayer) updates) => super.copyWith((message) => updates(message as RpcPlayer));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RpcPlayer create() => RpcPlayer._();
  RpcPlayer createEmptyInstance() => create();
  static $pb.PbList<RpcPlayer> createRepeated() => $pb.PbList<RpcPlayer>();
  @$core.pragma('dart2js:noInline')
  static RpcPlayer getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RpcPlayer>(create);
  static RpcPlayer _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get playerName => $_getSZ(0);
  @$pb.TagNumber(1)
  set playerName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlayerName() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlayerName() => clearField(1);

  @$pb.TagNumber(2)
  RpcPlayer_player_state get playerStatus => $_getN(1);
  @$pb.TagNumber(2)
  set playerStatus(RpcPlayer_player_state v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPlayerStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlayerStatus() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get harte => $_getIZ(2);
  @$pb.TagNumber(3)
  set harte($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHarte() => $_has(2);
  @$pb.TagNumber(3)
  void clearHarte() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get dice => $_getList(3);
}

