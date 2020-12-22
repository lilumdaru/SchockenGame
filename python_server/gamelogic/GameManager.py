# from MyEnums import GameState
# from Player import Player
import os
import sys
from enum import Enum

# sys.path.append(os.path.join(os.path.dirname(__file__), "..", "DataStructure"))
from Player import Player
from Game import Game
from MyEnums import GameState
from Logger import Logger
import random
import string

logger = Logger()

class GameManager:
    games = {}  # dict holding GameName -> Game
    # gameNameID = {}  # dict holding GameName -> Game
    MAX_GAMES = 50
    GAME_NAME_LENGTH = 3
    game_counter = 1


    def register_game(self):
        # call cleanup
        self.cleanup()
        # check sum of existing games >= MAX_GAMES
        if (len(self.games) >= self.MAX_GAMES):
            # ERROR-MSG
            return self.return_error("Maximum Number of games on server reached! Please try again later")

        # Create new Game Object with Random Name and add it to dicts
        game_name = self.generate_game_name()
        new_game = Game()
        new_game.game_name = game_name
        self.games[game_name] = new_game

        logger.log("create new Game with name: " + game_name + " and ID: " + str(self.game_counter))
        self.games[game_name].game_id = self.game_counter
        self.game_counter = self.game_counter +1
        self.games[game_name].game_status = GameState.LOBBY

        # Reset Timestamp
        self.touch_game(game_name)

        # Return GameID-Data
        return self.games[game_name]


    def register_player(self, game_name, player_name):
        # if game exists in dict
        if(not self.game_name_exist(game_name)):
            return self.return_error("Game name doesn't exist!")
        # if game_state != LOBBY
        if(self.games[game_name].game_status != GameState.LOBBY):
            return self.return_error("Register to game is not possible. Was the game already started?")
        # if max Players for game reached
        if(self.games[game_name].max_players_reached()):
            return self.return_error("Maximum number of players for the game is reached.")
        # if Player name not in game, yet
        if(self.games[game_name].player_name_exists(player_name)):
            return self.return_error("Playername is already taken, please chose another name.")

        # add player to game
        myGame = self.games[game_name]
        myGame.add_player(player_name)

        # Reset Timestamp
        self.touch_game(game_name)

        return self.games[game_name]


    def get_player_list(self, game_name):
        # if game exists in dict
        if(not self.game_name_exist(game_name)):
            return self.return_error("Game name doesn't exist!")
        # if game_status != LOBBY
        if(self.games[game_name].game_status != GameState.LOBBY and self.games[game_name].game_status != GameState.STARTING ):
            return self.return_error("Unexpected Gamestatus. Was the game already started?")

        # Reset Timestamp
        self.touch_game(game_name)

        # return PlayerList Data
        return self.games[game_name]


    def start_game(self, game_name):
        # if game exists in dict
        if(not self.game_name_exist(game_name)):
            return self.return_error("Game name doesn't exist!")
        # if game_state != LOBBY
        if(self.games[game_name].game_status != GameState.LOBBY):
            return self.return_error("Starting game is not possible. Was the game already started?")
        # set game_state = STARTING
        self.games[game_name].set_game_status(GameState.STARTING)
        return self.games[game_name]


    def touch_dice(self, game_name, player_name, dice_id):
        # if game exists in dict
        if(not self.game_name_exist(game_name)):
            return self.return_error("Game name doesn't exist!")
        # if game_Status != RUNNING: do nothing, return current Game:
        if(self.games[game_name].game_status != GameState.RUNNING):
            return self.games[game_name]
        # call Method in Game
        self.games[game_name].touch_dice(player_name, dice_id)
        return self.games[game_name]


    def touch_cup(self, game_name, player_name):
        # if game exists in dict
        if(not self.game_name_exist(game_name)):
            return self.return_error("Game name doesn't exist!")
        # if game_Status != RUNNING: do nothing, return current Game:
        if(self.games[game_name].game_status != GameState.RUNNING):
            return self.games[game_name]
        # call Method in Game
        self.games[game_name].touch_cup(player_name)
        return self.games[game_name]


    def end_turn(self, game_name, player_name):
        # if game exists in dict
        if(not self.game_name_exist(game_name)):
            return self.return_error("Game name doesn't exist!")
        # if game_Status != RUNNING: do nothing, return current Game:
        if(self.games[game_name].game_status != GameState.RUNNING):
            return self.games[game_name]
        # call Method in Game
        self.games[game_name].end_turn(player_name)
        return self.games[game_name]


    def refresh_game(self, game_name, player_name):
        # if game doesnt exists in dict
        if(not self.game_name_exist(game_name)):
            return self.return_error("Game name doesn't exist!")
        # check game Status
        if(self.games[game_name].game_status != GameState.STARTING and self.games[game_name].game_status != GameState.RUNNING and self.games[game_name].game_status != GameState.SEND_REPORT):
            return self.return_error("Game not running. Is the game already ended?")

        self.games[game_name].refresh_player(player_name)
        return self.games[game_name]

    def turn_six(self, game_name, player_name):
        # if game exists in dict
        if(not self.game_name_exist(game_name)):
            return self.return_error("Game name doesn't exist!")
        # if game_Status != RUNNING: do nothing, return current Game:
        if(self.games[game_name].game_status != GameState.RUNNING):
            return self.games[game_name]
        # call Method in Game
        self.games[game_name].turn_six(player_name)
        return self.games[game_name]


    def cleanup(self):
        # check all games and delete idle games.
        #TODO
        pass


    def touch_game(self, game_name):
        # if GameName exists, save current timestamp inside
        #TODO
        pass


    # def return_game(self, game_name):
    #     # if GameName exists, return game
    #     if(self.game_name_exist(game_name)):
    #         return self.games[game_name]
    #     else:
    #         return self.return_error("Game name doesn't exist!")


    def game_name_exist(self, game_name):
        # check here
        if (game_name in self.games.keys()):
            return True
        else:
            return False


    def return_error(self, error_msg):
        # Build a GameObject with Error
        error_game = Game()
        error_game.message = error_msg
        error_game.game_status = GameState.ERROR
        return error_game


    def generate_game_name(self):
        letters = string.ascii_uppercase
        search_name = True
        game_name = ''
        while (search_name):
            game_name = ''.join(random.choice(letters) for i in range(self.GAME_NAME_LENGTH))
            search_name = self.game_name_exist(game_name)
        return game_name



if (__name__ == '__main__'):
    my_game_manager = GameManager()

    game = my_game_manager.register_game()
    reg_res1 = my_game_manager.register_player(game.game_name, "player1")
    reg_res2 = my_game_manager.register_player(game.game_name, "player2")
    reg_res3 = my_game_manager.register_player(game.game_name, "player3")
    reg_res4 = my_game_manager.register_player(game.game_name, "player4")
    reg_res5 = my_game_manager.register_player(game.game_name, "player5")

    logger.log(reg_res1.message)
    logger.log(reg_res2.message)
    logger.log(reg_res3.message)
    logger.log(reg_res4.message)
    logger.log(reg_res5.message)

    for i in range(len(reg_res1.players)):
        logger.log(reg_res1.players[i].player_name)