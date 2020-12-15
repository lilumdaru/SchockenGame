///
//  Generated code. Do not modify.
//  source: schocken_rpc.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'schocken_rpc.pb.dart' as $0;
export 'schocken_rpc.pb.dart';

class SchockenConnectorClient extends $grpc.Client {
  static final _$registerPlayer =
      $grpc.ClientMethod<$0.PlayerInfo, $0.RegistrationResponse>(
          '/SchockenConnector/registerPlayer',
          ($0.PlayerInfo value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.RegistrationResponse.fromBuffer(value));
  static final _$getPlayerList = $grpc.ClientMethod<$0.GameID, $0.PlayerList>(
      '/SchockenConnector/getPlayerList',
      ($0.GameID value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.PlayerList.fromBuffer(value));
  static final _$registerGame = $grpc.ClientMethod<$0.PlayerInfo, $0.GameID>(
      '/SchockenConnector/registerGame',
      ($0.PlayerInfo value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GameID.fromBuffer(value));
  static final _$startGame =
      $grpc.ClientMethod<$0.GameID, $0.StartGameResponse>(
          '/SchockenConnector/startGame',
          ($0.GameID value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.StartGameResponse.fromBuffer(value));
  static final _$touchDice = $grpc.ClientMethod<$0.DiceTouched, $0.RpcGameData>(
      '/SchockenConnector/touchDice',
      ($0.DiceTouched value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RpcGameData.fromBuffer(value));
  static final _$touchCup = $grpc.ClientMethod<$0.PlayerInfo, $0.RpcGameData>(
      '/SchockenConnector/touchCup',
      ($0.PlayerInfo value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RpcGameData.fromBuffer(value));
  static final _$turnSix = $grpc.ClientMethod<$0.PlayerInfo, $0.RpcGameData>(
      '/SchockenConnector/turnSix',
      ($0.PlayerInfo value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RpcGameData.fromBuffer(value));
  static final _$endTurn = $grpc.ClientMethod<$0.PlayerInfo, $0.RpcGameData>(
      '/SchockenConnector/endTurn',
      ($0.PlayerInfo value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RpcGameData.fromBuffer(value));
  static final _$refreshGame =
      $grpc.ClientMethod<$0.PlayerInfo, $0.RpcGameData>(
          '/SchockenConnector/refreshGame',
          ($0.PlayerInfo value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.RpcGameData.fromBuffer(value));

  SchockenConnectorClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.RegistrationResponse> registerPlayer(
      $0.PlayerInfo request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$registerPlayer, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.PlayerList> getPlayerList($0.GameID request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getPlayerList, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.GameID> registerGame($0.PlayerInfo request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$registerGame, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.StartGameResponse> startGame($0.GameID request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$startGame, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.RpcGameData> touchDice($0.DiceTouched request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$touchDice, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.RpcGameData> touchCup($0.PlayerInfo request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$touchCup, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.RpcGameData> turnSix($0.PlayerInfo request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$turnSix, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.RpcGameData> endTurn($0.PlayerInfo request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$endTurn, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.RpcGameData> refreshGame($0.PlayerInfo request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$refreshGame, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class SchockenConnectorServiceBase extends $grpc.Service {
  $core.String get $name => 'SchockenConnector';

  SchockenConnectorServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.PlayerInfo, $0.RegistrationResponse>(
        'registerPlayer',
        registerPlayer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PlayerInfo.fromBuffer(value),
        ($0.RegistrationResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GameID, $0.PlayerList>(
        'getPlayerList',
        getPlayerList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GameID.fromBuffer(value),
        ($0.PlayerList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PlayerInfo, $0.GameID>(
        'registerGame',
        registerGame_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PlayerInfo.fromBuffer(value),
        ($0.GameID value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GameID, $0.StartGameResponse>(
        'startGame',
        startGame_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GameID.fromBuffer(value),
        ($0.StartGameResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DiceTouched, $0.RpcGameData>(
        'touchDice',
        touchDice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DiceTouched.fromBuffer(value),
        ($0.RpcGameData value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PlayerInfo, $0.RpcGameData>(
        'touchCup',
        touchCup_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PlayerInfo.fromBuffer(value),
        ($0.RpcGameData value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PlayerInfo, $0.RpcGameData>(
        'turnSix',
        turnSix_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PlayerInfo.fromBuffer(value),
        ($0.RpcGameData value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PlayerInfo, $0.RpcGameData>(
        'endTurn',
        endTurn_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PlayerInfo.fromBuffer(value),
        ($0.RpcGameData value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PlayerInfo, $0.RpcGameData>(
        'refreshGame',
        refreshGame_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PlayerInfo.fromBuffer(value),
        ($0.RpcGameData value) => value.writeToBuffer()));
  }

  $async.Future<$0.RegistrationResponse> registerPlayer_Pre(
      $grpc.ServiceCall call, $async.Future<$0.PlayerInfo> request) async {
    return registerPlayer(call, await request);
  }

  $async.Future<$0.PlayerList> getPlayerList_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GameID> request) async {
    return getPlayerList(call, await request);
  }

  $async.Future<$0.GameID> registerGame_Pre(
      $grpc.ServiceCall call, $async.Future<$0.PlayerInfo> request) async {
    return registerGame(call, await request);
  }

  $async.Future<$0.StartGameResponse> startGame_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GameID> request) async {
    return startGame(call, await request);
  }

  $async.Future<$0.RpcGameData> touchDice_Pre(
      $grpc.ServiceCall call, $async.Future<$0.DiceTouched> request) async {
    return touchDice(call, await request);
  }

  $async.Future<$0.RpcGameData> touchCup_Pre(
      $grpc.ServiceCall call, $async.Future<$0.PlayerInfo> request) async {
    return touchCup(call, await request);
  }

  $async.Future<$0.RpcGameData> turnSix_Pre(
      $grpc.ServiceCall call, $async.Future<$0.PlayerInfo> request) async {
    return turnSix(call, await request);
  }

  $async.Future<$0.RpcGameData> endTurn_Pre(
      $grpc.ServiceCall call, $async.Future<$0.PlayerInfo> request) async {
    return endTurn(call, await request);
  }

  $async.Future<$0.RpcGameData> refreshGame_Pre(
      $grpc.ServiceCall call, $async.Future<$0.PlayerInfo> request) async {
    return refreshGame(call, await request);
  }

  $async.Future<$0.RegistrationResponse> registerPlayer(
      $grpc.ServiceCall call, $0.PlayerInfo request);
  $async.Future<$0.PlayerList> getPlayerList(
      $grpc.ServiceCall call, $0.GameID request);
  $async.Future<$0.GameID> registerGame(
      $grpc.ServiceCall call, $0.PlayerInfo request);
  $async.Future<$0.StartGameResponse> startGame(
      $grpc.ServiceCall call, $0.GameID request);
  $async.Future<$0.RpcGameData> touchDice(
      $grpc.ServiceCall call, $0.DiceTouched request);
  $async.Future<$0.RpcGameData> touchCup(
      $grpc.ServiceCall call, $0.PlayerInfo request);
  $async.Future<$0.RpcGameData> turnSix(
      $grpc.ServiceCall call, $0.PlayerInfo request);
  $async.Future<$0.RpcGameData> endTurn(
      $grpc.ServiceCall call, $0.PlayerInfo request);
  $async.Future<$0.RpcGameData> refreshGame(
      $grpc.ServiceCall call, $0.PlayerInfo request);
}
