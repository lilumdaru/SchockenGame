import json
from gamelogic.Player import Player  # pylint: disable=import-error


class IfPlayer:
    def __init__(self, player: Player):
        self.player_name = player.player_name
        self.player_state = player.player_status
        self.discs = player.harte
        self.dices = player.dices
        self.lost_half = player.lost_half
