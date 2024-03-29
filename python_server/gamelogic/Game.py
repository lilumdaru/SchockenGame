from gamelogic.MyEnums import (
    Round,
    GameState,
    PlayerState,
)  # pylint: disable=import-error
from gamelogic.Player import Player  # pylint: disable=import-error
import random
import time
from gamelogic.Logger import Logger

random.seed()
logger = Logger()


class Game:
    def __init__(self):
        self.game_name = ""
        self.game_id = 0
        self.players = []
        self.game_status = GameState.UNINITIALIZED
        # active_player = Player()
        self.active_roll = 0
        self.max_rolls = 3
        self.messages = []
        self.error_msg = ""
        self.last_action = 0  # or use timestamp compatible datatyp
        self.player_counter = 0
        self.turn_six_button = False
        self.count_sixer = 0
        self.id_player_active = 0
        self.harte_stack = 13
        self.MAX_PLAYERS = 10
        self.send_report = False
        self.round = Round.ROUND1_FH
        self.timeout_no_rolls = 5
        self.timeout_rolls_possible = 60
        self.last_activity = time.time() + 60
        self.timeout = 0

    def player_name_exists(self, player_name):
        for player in self.players:
            if player.player_name == player_name:
                return True
        return False

    def set_game_status(self, new_game_status):
        self.game_status = new_game_status

    def get_player_by_name(self, player_name):
        for player in self.players:
            if player.player_name == player_name:
                return player
        return False

    def add_player(self, player_name):
        new_player = Player()
        new_player.player_name = player_name
        new_player.player_id = self.player_counter
        self.player_counter = self.player_counter + 1
        self.players.append(new_player)

    def touch_dice(self, player_name, dice_id):
        # check if player_name is active player
        player = self.players[self.id_player_active]
        if player.player_name != player_name:
            return
        # avoid index out of range
        if len(player.dices) <= dice_id:
            return
        if self.max_rolls - self.active_roll <= 0:
            return
        # remove dice with dice_id from dice list
        player.dices[dice_id] = 0

    def touch_cup(self, player_name):
        # check if player_name is active player
        player = self.players[self.id_player_active]
        if player.player_name != player_name:
            return
        # check if active_roll < max_rolls
        if self.active_roll >= self.max_rolls:
            return
        while player.dices.count(0) > 0:  # 0 is a place holder for a touched dice
            player.dices.remove(0)
        if len(player.dices) == 3:
            return
        if self.max_rolls - self.active_roll == 1:
            self.active_roll = self.active_roll + 1
            return
        self.turn_six_button = False
        # roll dices until 3 dices are full
        self.count_sixer = 0
        while len(player.dices) < 3:
            new_dice = random.randint(1, 6)
            player.dices.append(new_dice)
            if new_dice == 6:
                self.count_sixer = self.count_sixer + 1
        if self.count_sixer >= 2 and self.active_roll < self.max_rolls:
            self.turn_six_button = True

        # increase active_roll by 1
        self.active_roll = self.active_roll + 1
        # set time for turn timeout:
        self.last_activity = time.time()

    def turn_six(self, player_name):
        # check if player_name is active player
        player = self.players[self.id_player_active]
        if player.player_name != player_name:
            return
        if self.turn_six_button == True and self.count_sixer >= 2:
            self.turn_six_button = False
            if self.count_sixer == 2 and player.dices.count(6) >= 2:
                player.dices.remove(6)
                player.dices.remove(6)
                player.dices.append(1)
            if self.count_sixer == 3 and player.dices.count(6) == 3:
                player.dices.clear()
                player.dices.append(1)
                player.dices.append(1)

    def end_turn(self, player_name):
        # check if player_name is active player
        if self.players[self.id_player_active].player_name != player_name:
            return
        self.turn_six_button = False
        # first players sets max number of rolls for round
        if self.id_player_active == 0:
            if (
                len(self.players[self.id_player_active].dices)
                - self.players[self.id_player_active].dices.count(0)
                != 3
            ):
                self.active_roll = self.active_roll + 1
                if self.active_roll > 3:
                    self.active_roll = 3
            self.max_rolls = self.active_roll
            if self.max_rolls == 0:
                self.max_rolls = 1
        # change player_status active to passive and next player to active
        self.players[self.id_player_active].player_status = PlayerState.PASSIVE

        search_next_player = True
        count = 1
        while search_next_player:
            if len(self.players) > self.id_player_active + count:
                if (
                    self.players[self.id_player_active + count].player_status
                    == PlayerState.PASSIVE
                ):
                    # next player
                    self.id_player_active = self.id_player_active + count
                    self.active_roll = 0
                    self.players[
                        self.id_player_active
                    ].player_status = PlayerState.ACTIVE
                    self.touch_cup(self.players[self.id_player_active].player_name)
                    search_next_player = False
                else:
                    count = count + 1
            else:
                search_next_player = False
                self.end_round()

        # set time for turn timeout:
        self.last_activity = time.time()

    def refresh_player(self, player_name):
        # check if player_name exists
        if not self.player_name_exists(player_name):
            return
        current_player = self.get_player_by_name(player_name)

        ## Manage round start
        # if player is UNINITIALIZED, set ARRIVED
        if current_player.player_status == PlayerState.UNINITIALIZED:
            current_player.player_status = PlayerState.ARRIVED
        # if all player are ARRIVED, start Game, game_status = RUNNING, player_status ACTIVE/PASSIV
        all_arrived = True
        for player in self.players:
            if player.player_status != PlayerState.ARRIVED:
                all_arrived = False
        if all_arrived:
            # start a new game round
            self.start_round()
            self.game_status = GameState.RUNNING

        # send end of round Report
        if current_player.player_status == PlayerState.SEND_REPORT:
            self.send_report = True
            current_player.player_status = PlayerState.ARRIVED
        else:
            self.send_report = False

        # check timeout
        self.check_timeout(player_name)

        self.touch_player(player_name)
        self.cleanup()

    def randomize_player_order(self):
        # change order of players to random start player:
        start_player_id = random.randint(0, len(self.players) - 1)
        self.players = self.players[start_player_id:] + self.players[:start_player_id]

    def end_round(self):
        # find harte
        # find loser
        index_looser = 0
        index_winner = 0
        i = 0
        temp_harte = 0
        temp_points_low = 10000
        temp_points_high = 0
        for player in self.players:
            if player.player_status == PlayerState.SPEC:
                i = i + 1
                continue
            [harte, points] = player.calc_harte_points()
            # find harte
            if harte > temp_harte:
                temp_harte = harte
            # first half:
            if not self.isBackround():
                # find winner
                if points > temp_points_high:
                    player_winning = player
                    temp_points_high = points
                    index_winner = i
                # find looser
                if points <= temp_points_low:
                    index_looser = i
                    temp_points_low = points
                    player_loosing = player
            else:  # second half / back round:
                # find winner
                if points >= temp_points_high:
                    player_winning = player
                    temp_points_high = points
                    index_winner = i
                # find looser
                if points < temp_points_low:
                    index_looser = i
                    temp_points_low = points
                    player_loosing = player
            i = i + 1

        i = 0
        # safe looser first Half for later use
        indexLooserFirstHalf = index_looser
        for player in self.players:
            if player.lost_half == 1:
                indexLooserFirstHalf = i
            i = i + 1

        if temp_points_high == 999:
            # 1 1 1
            self.messages.append(player_winning.player_name + " hat ausgeschockt!")
            if self.round == Round.FINALE_FH or self.round == Round.FINALE_BACK:
                self.messages.append(
                    player_loosing.player_name + " verliert das Finale!"
                )
            else:
                self.messages.append(
                    player_loosing.player_name + " verliert diese Halbzeit!"
                )

            player_loosing.lost_half = player_loosing.lost_half + 1
            self.nextFullRound(self.players[index_looser])
        elif temp_points_low == 1:
            # 2 2 1
            self.messages.append(player_loosing.player_name + " hat Dibborsch!")
            player_loosing.lost_half = player_loosing.lost_half + 1
            self.nextFullRound(self.players[index_looser])
        else:
            # normal end of round:
            # distribute harte
            # first half
            if not self.isBackround():
                if temp_harte > self.harte_stack:
                    temp_harte = self.harte_stack
                self.harte_stack = self.harte_stack - temp_harte
                self.players[index_looser].harte = (
                    self.players[index_looser].harte + temp_harte
                )
                self.messages.append(
                    player_winning.player_name
                    + " verteilt "
                    + str(temp_harte)
                    + " Harte an "
                    + player_loosing.player_name
                    + "."
                )
            else:
                # second half / Back round
                if temp_harte > self.players[index_winner].harte:
                    temp_harte = self.players[index_winner].harte
                self.harte_stack = self.harte_stack + temp_harte
                self.players[index_winner].harte = (
                    self.players[index_winner].harte - temp_harte
                )
                self.messages.append(
                    player_winning.player_name
                    + " legt "
                    + str(temp_harte)
                    + " Harte zurück auf den Stapel."
                )

            self.messages.append(
                str(self.harte_stack) + " Harte liegen auf dem Stapel."
            )

            self.changeRound(self.players[index_looser])

        logger.log("current round: " + str(self.round))
        for player in self.players:
            logger.log(player.player_name + " lost_half: " + str(player.lost_half))
            logger.log(player.player_name + " harte: " + str(player.harte))

        # change order of List
        if not self.isBackround():
            if self.round == Round.FINALE_FH and self.harte_stack == 13:
                # looser of first half is first
                self.players = (
                    self.players[indexLooserFirstHalf:]
                    + self.players[:indexLooserFirstHalf]
                )
            else:
                # change order of List, looser is first now!
                self.players = self.players[index_looser:] + self.players[:index_looser]
        else:
            # Back round: Player with most discs is first now!
            high_discs = 0
            # find max discs:
            for player in self.players:
                if player.harte > high_discs:
                    high_discs = player.harte

            # find all players with max disc:
            index = 0
            players_index_max_disc = []
            names = []
            for player in self.players:
                if player.harte == high_discs:
                    players_index_max_disc.append(index)
                    names.append(player.player_name)
                index = index + 1

            if len(players_index_max_disc) == 1:
                # one player with most harte
                index = players_index_max_disc[0]
                self.players = self.players[index:] + self.players[:index]
            else:
                # two or more players have the same amount of harte
                nr = random.randint(0, len(players_index_max_disc) - 1)
                index = players_index_max_disc[nr]
                self.players = self.players[index:] + self.players[:index]
                self.messages.append(
                    ", ".join(names)
                    + " haben jeweils "
                    + str(high_discs)
                    + " Harte. Der Zufallsgenerator entscheidet: "
                    + self.players[0].player_name
                    + " darf anfangen."
                )

        for player in self.players:
            player.player_status = PlayerState.SEND_REPORT
        self.game_status = GameState.SEND_REPORT

    def nextFullRound(self, looser):
        for player in self.players:
            player.harte = 0
        self.harte_stack = 13

        if self.round == Round.ROUND1_FH or self.round == Round.ROUND1_BACK:
            self.round = Round.ROUND2_FH

        elif self.round == Round.ROUND2_FH or self.round == Round.ROUND2_BACK:
            self.round = Round.FINALE_FH
            # check if looser already has lost 1 half, if yes, skipp Finale
            if looser.lost_half == 2:
                self.messages.append(
                    looser.player_name
                    + " hat beide Hälften verloren, "
                    + looser.player_name
                    + " muss ne Runde geben."
                )
                self.resetGame()
            else:
                self.messages.append("Die Final Runde beginnt.")

        elif self.round == Round.FINALE_FH or self.round == Round.FINALE_BACK:
            self.messages.append(
                looser.player_name
                + " hat das Finale verloren, "
                + looser.player_name
                + " muss ne Runde geben."
            )
            self.resetGame()

    def changeRound(self, looser):
        if self.round == Round.ROUND1_FH and self.harte_stack == 0:
            self.round = Round.ROUND1_BACK
        if self.round == Round.ROUND2_FH and self.harte_stack == 0:
            self.round = Round.ROUND2_BACK
        if self.round == Round.FINALE_FH and self.harte_stack == 0:
            self.round = Round.FINALE_BACK

        # get number of players with harte:
        nr = 0
        one_player = False
        for player in self.players:
            if player.harte != 0:
                nr = nr + 1
        if nr <= 1:
            one_player = True
        logger.log(
            "player_name: "
            + looser.player_name
            + ", nr: "
            + str(nr)
            + ", one_player: "
            + str(one_player)
        )

        if self.round == Round.ROUND1_BACK and one_player:
            looser.lost_half = 1
            self.messages.append(looser.player_name + " hat die erste Hälfte verloren.")
            for player in self.players:
                player.harte = 0
            self.harte_stack = 13
            self.round = Round.ROUND2_FH

        elif self.round == Round.ROUND2_BACK and one_player:
            if (
                looser.lost_half == 1
            ):  # if looser lost first half, he already has 1 marker!
                self.messages.append(
                    looser.player_name
                    + " hat beide Hälften verloren, "
                    + looser.player_name
                    + " muss ne Runde geben."
                )
                self.resetGame()
            else:
                looser.lost_half = looser.lost_half + 1
                for player in self.players:
                    player.harte = 0
                self.harte_stack = 13
                self.messages.append(
                    looser.player_name
                    + " hat die zweite Hälfte verloren. Das Finale beginnt."
                )
                self.round = Round.FINALE_FH

        elif self.round == Round.FINALE_BACK and one_player:
            self.messages.append(
                looser.player_name
                + " hat das Finale verloren, "
                + looser.player_name
                + " muss ne Runde geben."
            )
            self.resetGame()

    def resetGame(self):
        for player in self.players:
            player.harte = 0
            player.lost_half = 0
        self.harte_stack = 13
        self.round = Round.ROUND1_FH
        self.messages.append("Ein neues Spiel startet.")
        # include new joined players here

    def setPlayersSpec(self):
        if self.isBackround():
            for player in self.players:
                logger.log(player.player_name + " hat " + str(player.harte))
                if player.harte == 0:
                    player.player_status = PlayerState.SPEC

        if self.round == Round.FINALE_FH or self.round == Round.FINALE_BACK:
            for player in self.players:
                if player.lost_half == 0:
                    player.player_status = PlayerState.SPEC

    def isBackround(self):
        if (
            self.round == Round.ROUND1_BACK
            or self.round == Round.ROUND2_BACK
            or self.round == Round.FINALE_BACK
        ):
            return True
        else:
            return False

    def start_round(self):
        self.active_roll = 0
        self.max_rolls = 3
        self.id_player_active = 0
        self.messages.clear()
        for player in self.players:
            player.dices.clear()
            player.player_status = PlayerState.PASSIVE

        self.setPlayersSpec()
        # find first PASSIVE player starts the game:
        for player in self.players:
            if player.player_status == PlayerState.PASSIVE:
                player.player_status = PlayerState.ACTIVE
                self.touch_cup(player.player_name)
                break

    def max_players_reached(self):
        if len(self.players) >= self.MAX_PLAYERS:
            return True
        else:
            return False

    def cleanup(self):
        # check all players and delete idle players.
        players_to_del = []
        for player in self.players:
            if time.time() > player.last_action + 10:
                players_to_del.append(player)

        for player in players_to_del:
            # check if timeout player is active
            if player.player_status == PlayerState.ACTIVE:
                self.end_turn(player.player_name)
            # check if timeout player is finale attende:
            if player.lost_half > 0:
                self.messages.append(
                    player.player_name
                    + " hat die Verbindung verloren. Damit fehlt nun ein Teilnehmer für das Finale."
                )
                self.players.remove(player)
                self.end_round()
                self.randomize_player_order()
                self.resetGame()
            else:
                self.players.remove(player)

    def touch_player(self, player_name):
        # if playername exists, save current timestamp inside
        for player in self.players:
            if player.player_name == player_name:
                player.last_action = time.time()
                break

    def check_timeout(self, player_name):
        # leave function if not executed by active player
        if player_name != self.players[self.id_player_active].player_name:
            return

        if self.active_roll == self.max_rolls:
            # use self.timeout_no_rolls
            self.timeout = self.timeout_no_rolls - (time.time() - self.last_activity)
            if time.time() - self.last_activity > self.timeout_no_rolls:
                self.end_turn(self.players[self.id_player_active].player_name)
        else:
            # use self.timeout_rolls_possible
            self.timeout = self.timeout_rolls_possible - (
                time.time() - self.last_activity
            )
            if time.time() - self.last_activity > self.timeout_rolls_possible:
                self.end_turn(self.players[self.id_player_active].player_name)
