import random
random.seed()


class SchockenGame:

    def __init__(self):
        self.__players_dice = {}

    def roll(self, name):
        self.__players_dice[name] = "x x x"
        return self.__players_dice[name]

    def up(self, name):
        if name in self.__players_dice.keys():
            self.__players_dice[name] = self.__players_dice[name].replace(
                "x", str(random.randint(1, 6)), 1)
            self.__players_dice[name] = self.__players_dice[name].replace(
                "x", str(random.randint(1, 6)), 1)
            self.__players_dice[name] = self.__players_dice[name].replace(
                "x", str(random.randint(1, 6)), 1)
            return self.__players_dice[name]
        else:
            return "Spieler spielt nicht mit."

    def status(self):
        return self.__players_dice

    def player_status(self, name):
        if name in self.__players_dice.keys():
            return self.__players_dice[name]
        else:
            return "Spieler spielt nicht mit."

    # roll only specific dices
    # @name: playername
    # @numbers: List of numbers to roll

    def roll_single(self, name, numbers):
        if name not in self.__players_dice.keys():
            self.__players_dice[name] = "x x x"
        for number in numbers:
            if number in self.__players_dice[name] and number.strip() != '':
                self.__players_dice[name] = self.__players_dice[name].replace(
                    number, "x", 1)
        return self.__players_dice[name]

    def all_players_roll(self):
        for name in self.__players_dice:
            self.__players_dice[name] = "x x x"
        return self.__players_dice

    def all_players_up(self):
        for name in self.__players_dice:
            self.__players_dice[name] = self.__players_dice[name].replace(
                "x", str(random.randint(1, 6)), 1)
            self.__players_dice[name] = self.__players_dice[name].replace(
                "x", str(random.randint(1, 6)), 1)
            self.__players_dice[name] = self.__players_dice[name].replace(
                "x", str(random.randint(1, 6)), 1)
        return self.__players_dice

    def clear(self):
        self.__players_dice.clear()

    def turn6(self, name):
        number6 = self.__players_dice[name].count('6')
        if number6 == 3:
            self.__players_dice[name] = self.__players_dice[name].replace(
                "6", "1", 2)
            self.__players_dice[name] = self.__players_dice[name].replace(
                "6", "x", 1)
        if number6 == 2:
            self.__players_dice[name] = self.__players_dice[name].replace(
                "6", "1", 1)
            self.__players_dice[name] = self.__players_dice[name].replace(
                "6", "x", 1)
        return self.__players_dice[name]
