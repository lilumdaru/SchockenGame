import 'package:schocken_game/shared/player.dart';
import 'package:schocken_game/shared/sharedEnums.dart';

class RespPlayer {
  final String playerName;
  final PlayerState playerState;
  final int discs;
  final List<int> dices;
  final bool lostHalf;

  const RespPlayer(
      {this.playerName,
      this.playerState,
      this.discs,
      this.dices,
      this.lostHalf});

  factory RespPlayer.fromJson(Map<String, dynamic> json) {
    return RespPlayer(
      playerName: json['player_name'],
      playerState: json['player_state'],
      discs: json['discs'],
      dices: json['dices'],
      lostHalf: json['lost_half'],
    );
  }

  Player parseToPlayer() {
    return Player(this.playerName, this.playerState, this.discs, this.dices,
        this.lostHalf);
  }
}
