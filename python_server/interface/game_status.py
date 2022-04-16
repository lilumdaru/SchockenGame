from enum import Enum, IntEnum


# class GameStatus(str, Enum):
#     LOBBY = "LOBBY"
#     STARTING = "STARTING"
#     RUNNING = "RUNNING"
#     ENDED = "ENDED"
#     TIMEOUT = "TIMEOUT"
#     ERROR = "ERROR"


class GameStatus(IntEnum):
    LOBBY = 0
    STARTING = 1
    RUNNING = 2
    ENDED = 3
    TIMEOUT = 4
    ERROR = 5
