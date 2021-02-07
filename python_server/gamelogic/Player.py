from MyEnums import PlayerState # pylint: disable=import-error

import random
import time
random.seed()


class Player:
    def __init__(self):
        self.player_name = ""
        self.player_id = 0
        self.player_status = PlayerState.UNINITIALIZED
        self.harte = 0
        self.dices = []
        self.last_action = time.time()  # or use timestamp compatible datatyp
        self.lost_half = 0

    # see docu in excel file
    def calc_harte_points(self):
        while(self.dices.count(0) > 0): # 0 is a place holder for a touched dice
            self.dices.remove(0)
        while(len(self.dices) < 3):
            new_dice = random.randint(1, 6)
            self.dices.append(new_dice)
        harte = 0
        points = 0
        self.dices.sort(reverse=False)
        if(self.dices.count(1) == 3): # 1 1 1
            harte = 13
            points = 999
        elif(self.dices.count(1) == 2 and self.dices.count(6) == 1): # 1 1 6
            harte = 6
            points = 906
        elif(self.dices.count(1) == 2 and self.dices.count(5) == 1): # 1 1 5
            harte = 5
            points = 905
        elif(self.dices.count(1) == 2 and self.dices.count(4) == 1): # 1 1 4
            harte = 4
            points = 904
        elif(self.dices.count(1) == 2 and self.dices.count(3) == 1): # 1 1 3
            harte = 3
            points = 903
        elif(self.dices.count(1) == 2 and self.dices.count(2) == 1):# 1 1 2
            harte = 2
            points = 902
        elif(self.dices[0] == self.dices[1] and self.dices[0] == self.dices[2]): # a = b = c ;  e.g. 2 2 2
            harte = 3
            points = 800 + self.dices[0]
        elif(self.dices.count(4) == 1 and self.dices.count(5) == 1 and self.dices.count(6) == 1): # 4 5 6
            harte = 2
            points = 704
        elif(self.dices.count(3) == 1 and self.dices.count(4) == 1 and self.dices.count(5) == 1): # 3 4 5
            harte = 2
            points = 703
        elif(self.dices.count(2) == 1 and self.dices.count(3) == 1 and self.dices.count(4) == 1): # 2 3 4
            harte = 2
            points = 702
        elif(self.dices.count(1) == 1 and self.dices.count(2) == 1 and self.dices.count(3) == 1): # 1 2 3
            harte = 2
            points = 701
        elif(self.dices.count(2) == 2 and self.dices.count(1) == 1): # 2 2 1
            harte = 13
            points = 1
            self.dices.sort(reverse=True)
        else:
            harte = 1
            self.dices.sort(reverse=True)
            points = self.dices[0]*100 + self.dices[1]*10 + self.dices[2]

        result = [harte, points]
        return result


