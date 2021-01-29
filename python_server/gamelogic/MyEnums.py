from enum import Enum


class PlayerState(Enum):
    ACTIVE = 0
    PASSIVE = 1
    SPEC = 2
    LEFT = 3
    ARRIVED = 4
    UNINITIALIZED = 5
    SEND_REPORT = 6

    def __eq__(self, other):
        return self.value == other.value

    def __ne__(self, other):
        return self.value != other.value


class GameState(Enum):
    LOBBY = 0
    STARTING = 1
    RUNNING = 2
    ENDED = 3
    TIMEOUT = 4
    ERROR = 5
    UNINITIALIZED = 6
    SEND_REPORT = 7

    def __eq__(self, other):
        return self.value == other.value

    def __ne__(self, other):
        return self.value != other.value


class Round(Enum):
    ROUND1_FH = 0 # FH = First Half
    ROUND1_BACK = 1
    ROUND2_FH = 2
    ROUND2_BACK = 3
    FINALE_FH = 4
    FINALE_BACK = 5

    def __eq__(self, other):
        return self.value == other.value

    def __ne__(self, other):
        return self.value != other.value