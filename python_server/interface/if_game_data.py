import json
from gamelogic.Game import Game  # pylint: disable=import-error
from interface.if_player import IfPlayer  # pylint: disable=import-error


class GameData:
    def __init__(self, game: Game):
        self.game_name = game.game_name
        self.players = []
        for player in game.players:
            self.players.append(IfPlayer(player).__dict__)
        self.game_state = game.game_status
        self.active_roll = game.active_roll
        self.max_rolls = game.max_rolls
        self.messages = game.messages
        self.button_turn6 = game.turn_six_button
        self.generate_report = game.send_report
        self.discs_on_stack = game.harte_stack
        self.game_round = game.round
        self.error_msg = game.error_msg

    def get_json(self):
        return json.dumps(self.__dict__)
