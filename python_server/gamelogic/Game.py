from MyEnums import GameState, PlayerState
from Player import Player
import random

random.seed()

class Game:
    def __init__(self):
        self.game_name = ""
        self.game_id = 0
        self.players = []
        self.game_status = GameState.UNINITIALIZED
        # active_player = Player()
        self.active_roll = 0
        self.max_rolls = 3
        self.message = ""
        self.last_action = 0 # or use timestamp compatible datatyp
        self.player_counter = 0
        self.turn_six_button = False
        self.count_sixer = 0
        self.id_player_active = 0
        self.harte_stack = 13
        self.MAX_PLAYERS = 4
        self.send_report = False


    def player_name_exists(self, player_name):
        for player in self.players:
            if (player.player_name == player_name):
                return True
        return False


    def set_game_status(self, new_game_status):
        self.game_status = new_game_status


    def get_player_by_name(self, player_name):
        for player in self.players:
            if (player.player_name == player_name):
                return player
        return False


    def add_player(self, player_name):
        new_player = Player()
        new_player.player_name = player_name
        new_player.player_id = self.player_counter
        self.player_counter = self.player_counter +1
        self.players.append(new_player)


    def touch_dice(self, player_name, dice_id):
        # check if player_name is active player
        player = self.players[self.id_player_active]
        if(player.player_name != player_name):
            return
        # avoid index out of range
        if(len(player.dices) <= dice_id):
            return
        if(self.max_rolls - self.active_roll <= 0):
            return
        # remove dice with dice_id from dice list
        del player.dices[dice_id]


    def touch_cup(self, player_name):
        # check if player_name is active player
        player = self.players[self.id_player_active]
        if(player.player_name != player_name):
            return
        # check if active_roll < max_rolls
        if(self.active_roll >= self.max_rolls ):
            return
        if(len(player.dices) == 3):
            return
        if(self.max_rolls - self.active_roll == 1):
            self.active_roll = self.active_roll +1
            return
        # roll dices until 3 dices are full
        self.count_sixer = 0
        while(len(player.dices) < 3):
            new_dice = random.randint(1, 6)
            player.dices.append(new_dice)
            if(new_dice == 6):
                self.count_sixer = self.count_sixer +1
        if(self.count_sixer >= 2 and self.active_roll < self.max_rolls):
            self.turn_six_button = True

        # increase active_roll by 1
        self.active_roll = self.active_roll +1


    def turn_six(self, player_name):
        # check if player_name is active player
        player = self.players[self.id_player_active]
        if(player.player_name != player_name):
            return
        if(self.turn_six_button == True and self.count_sixer >= 2):
            self.turn_six_button = False
            if(self.count_sixer == 2 and player.dices.count(6) >= 2):
                player.dices.remove(6)
                player.dices.remove(6)
                player.dices.append(1)
            if(self.count_sixer == 3 and player.dices.count(6) == 3):
                player.dices.clear()
                player.dices.append(1)
                player.dices.append(1)


    def end_turn(self, player_name):
        # check if player_name is active player
        if(self.players[self.id_player_active].player_name != player_name):
            return
        # first players sets max number of rolls for round
        if(self.id_player_active == 0):
            if(len(self.players[self.id_player_active].dices) != 3):
                self.active_roll = self.active_roll +1
                if(self.active_roll > 3):
                    self.active_roll = 3
            self.max_rolls = self.active_roll
            if(self.max_rolls == 0):
                self.max_rolls = 1
        # change player_status active to passive and next player to active
        self.players[self.id_player_active].player_status = PlayerState.PASSIVE
        if(len(self.players) > self.id_player_active + 1):
            # next player
            self.id_player_active = self.id_player_active + 1
            self.active_roll = 0
            self.players[self.id_player_active].player_status = PlayerState.ACTIVE
            self.touch_cup(self.players[self.id_player_active].player_name)
        else:
            self.end_round()
    

    def refresh_player(self, player_name):
        # check if player_name exists
        if(not self.player_name_exists(player_name)):
            return
        current_player = self.get_player_by_name(player_name)

        ## Manage round start
        # if player is UNINITIALIZED, set ARRIVED
        if(current_player.player_status == PlayerState.UNINITIALIZED):
            current_player.player_status = PlayerState.ARRIVED
        # if all player are ARRIVED, start Game, game_status = RUNNING, player_status ACTIVE/PASSIV
        all_arrived = True
        for player in self.players:
            if(player.player_status != PlayerState.ARRIVED):
                all_arrived = False
        if(all_arrived):
            # start game
            self.start_round()
            self.game_status = GameState.RUNNING

        # send end of round Report
        if(current_player.player_status == PlayerState.SEND_REPORT):
            self.send_report = True
            current_player.player_status = PlayerState.ARRIVED
        else:
            self.send_report = False
        
        self.touch_player(player_name)
        self.cleanup()


    def end_round(self):
        # find harte
        # find loser
        index_looser = 0
        i=0
        temp_harte = 0
        temp_points = 10000 
        for player in self.players:
            [harte, points] = player.calc_harte_points()
            if(harte > temp_harte):
                temp_harte = harte
            if(points < temp_points):
                index_looser = i
                temp_points = points
            i = i+1
        # distribute harte
        if(temp_harte > self.harte_stack):
            temp_harte = self.harte_stack
        self.harte_stack = self.harte_stack - temp_harte
        self.players[index_looser].harte = self.players[index_looser].harte + temp_harte

        # change order of List, losser is first now!
        self.players = self.players[index_looser:] + self.players[:index_looser]

        for player in self.players:
            player.player_status = PlayerState.SEND_REPORT
        self.game_status = GameState.SEND_REPORT


    def start_round(self):
        self.active_roll = 0
        self.max_rolls = 3
        self.id_player_active = 0
        for player in self.players:
            player.dices.clear()
            player.player_status = PlayerState.PASSIVE
        self.players[0].player_status = PlayerState.ACTIVE
        self.touch_cup(self.players[0].player_name)


    def max_players_reached(self):
        if(len(self.players) >= self.MAX_PLAYERS):
            return True
        else:
            return False


    def cleanup(self):
        # check all players and delete idle players.
        #TODO
        pass


    def touch_player(self, player_name):
        # if playername exists, save current timestamp inside
        #TODO
        pass