# Server Stub for Schocken app implementation:
# pylint: disable=E1101

import logging
from flask import Flask, request, jsonify
from waitress import serve

from gamelogic.Game import Game
from interface.if_game_data import GameData
from gamelogic.Player import Player
from gamelogic.MyEnums import GameState

app = Flask(__name__)


logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


@app.post("/game")
def register_game():
    answer = {"game_name": "", "game_id": 0, "error_msg": "Error with request"}
    if request.is_json:
        content = request.get_json()
        logger.info(content["player_name"])
        answer["game_name"] = "ABC"
        answer["game_id"] = 2
        answer["error_msg"] = ""
        return answer, 200
    return answer, 400


@app.post("/player")
def register_player():
    answer = {"player_nr": 0, "game_id": 0, "error_msg": "Error with request"}
    if request.is_json:
        content = request.get_json()
        logger.info("player_name: " + content["player_name"])
        logger.info("game_name: " + content["game_name"])
        answer["game_id"] = 1
        answer["player_nr"] = 1
        answer["error_msg"] = ""
        return answer, 200
    return answer, 400


@app.get("/playerlist")
def get_playerlist():
    answer = {
        "game_state": GameState.ERROR,  # "LOBBY", "STARTING", "ERROR",
        "player_names": [],
        "error_msg": "Error with request",
    }

    if isinstance(request.args["player_name"], str) and isinstance(
        request.args["game_name"], str
    ):
        logger.info("player_name: " + request.args["player_name"])
        logger.info("game_name: " + request.args["game_name"])
        answer["player_names"] = ["player_name1", "player_name2"]
        answer["game_state"] = GameState.LOBBY
        answer["error_msg"] = ""
        return answer, 200
    return answer, 400


@app.post("/gamestart")
def start_game():
    answer = {"error_msg": "Error with request"}
    if request.is_json:
        content = request.get_json()
        logger.info("game_name: " + content["game_name"])
        answer["error_msg"] = ""
        return answer, 200
    return answer, 400


@app.post("/touch_dice")
def touch_dice():
    answer = {"error_msg": "Error with request"}
    if request.is_json:
        content = request.get_json()
        logger.info("game_name: " + content["game_name"])
        logger.info("player_name: " + content["player_name"])
        logger.info("dice_id: " + content["dice_id"])
        answer["error_msg"] = ""
        return convertGameData(), 200
    return answer, 400


@app.post("/touch_cup")
def touch_cup():
    answer = {"error_msg": "Error with request"}
    if request.is_json:
        content = request.get_json()
        logger.info("game_name: " + content["game_name"])
        logger.info("player_name: " + content["player_name"])
        answer["error_msg"] = ""
        return convertGameData(), 200
    return answer, 400


@app.post("/turn")
def end_turn():
    answer = {"error_msg": "Error with request"}
    if request.is_json:
        content = request.get_json()
        logger.info("game_name: " + content["game_name"])
        logger.info("player_name: " + content["player_name"])
        answer["error_msg"] = ""
        return convertGameData(), 200
    return answer, 400


@app.get("/game")
def refresh_game():
    answer = {"error_msg": "Error with request"}
    if request.is_json:
        content = request.get_json()
        logger.info("game_name: " + content["game_name"])
        logger.info("player_name: " + content["player_name"])
        answer["error_msg"] = ""
        return convertGameData(), 200
    return answer, 400


@app.post("/six")
def turn_sixer():
    answer = {"error_msg": "Error with request"}
    if request.is_json:
        content = request.get_json()
        logger.info("game_name: " + content["game_name"])
        logger.info("player_name: " + content["player_name"])
        answer["error_msg"] = ""
        return convertGameData(), 200
    return answer, 400


def convertGameData():
    test_game = Game()
    test_game.players.append(Player())
    test_game.players.append(Player())

    game_data = GameData(test_game)
    game_data_json = game_data.get_json()
    logger.info("game_data.get_json(): " + game_data_json)

    return game_data.get_json()


if __name__ == "__main__":
    serve(app, host="0.0.0.0", port=8080)
