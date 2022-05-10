# Server Stub for Schocken app implementation:
# pylint: disable=E1101

import logging
from flask import Flask, request
from waitress import serve

from interface.if_game_data import GameData
from gamelogic.MyEnums import GameState
from gamelogic.GameManager import GameManager

app = Flask(__name__)


logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

GM = GameManager()


@app.post("/game")
def register_game():
    answer = {"game_name": "", "game_id": 0, "error_msg": "Error with request"}
    if request.is_json:
        content = request.get_json()
        logger.info("registerGame by: " + content["player_name"])

        game = GM.register_game()
        answer["game_id"] = game.game_id
        answer["game_name"] = game.game_name
        answer["error_msg"] = game.error_msg
        logger.info("GameData.game_name: " + game.game_name)

        return answer, 200
    return answer, 400


@app.post("/player")
def register_player():

    answer = {"game_id": 0, "error_msg": "Error with request"}
    if request.is_json:

        content = request.get_json()
        logger.info(
            "register Player: "
            + content["player_name"]
            + " for Game: "
            + content["game_name"]
        )
        game = GM.register_player(content["game_name"].upper(), content["player_name"])
        answer["game_id"] = game.game_id
        answer["error_msg"] = game.error_msg
        return answer, 200
    return answer, 400


@app.get("/playerlist")
def get_playerlist():
    answer = {
        "game_state": GameState.ERROR,
        "player_names": [],
        "error_msg": "Error with request",
    }

    if isinstance(request.args["player_name"], str) and isinstance(
        request.args["game_name"], str
    ):
        game = GM.get_player_list(
            request.args["game_name"].upper(), request.args["player_name"]
        )
        answer["player_names"] = []
        for player in game.players:
            answer["player_names"].append(player.player_name)

        answer["game_state"] = game.game_status
        answer["error_msg"] = game.error_msg
        return answer, 200
    return answer, 400


@app.post("/gamestart")
def start_game():
    answer = {"error_msg": "Error with request"}
    if request.is_json:
        content = request.get_json()
        game = GM.start_game(content["game_name"].upper())
        answer["error_msg"] = game.error_msg
        return answer, 200
    return answer, 400


@app.post("/dice")
def touch_dice():
    answer = {"error_msg": "Error with request"}
    if request.is_json:
        content = request.get_json()
        # logger.info("game_name: " + content["game_name"])
        # logger.info("player_name: " + content["player_name"])
        # logger.info("dice_id: " + content["dice_id"])
        game = GM.touch_dice(
            content["game_name"].upper(),
            content["player_name"],
            int(content["dice_id"]),
        )
        return GameData(game).get_json(), 200
    return answer, 400


@app.post("/cup")
def touch_cup():
    answer = {"error_msg": "Error with request"}
    if request.is_json:
        content = request.get_json()
        # logger.info("game_name: " + content["game_name"])
        # logger.info("player_name: " + content["player_name"])
        game = GM.touch_cup(content["game_name"].upper(), content["player_name"])
        return GameData(game).get_json(), 200
    return answer, 400


@app.post("/turn")
def end_turn():
    answer = {"error_msg": "Error with request"}
    if request.is_json:
        content = request.get_json()
        # logger.info("game_name: " + content["game_name"])
        # logger.info("player_name: " + content["player_name"])
        game = GM.end_turn(content["game_name"].upper(), content["player_name"])
        return GameData(game).get_json(), 200
    return answer, 400


@app.get("/game")
def refresh_game():
    answer = {"error_msg": "Error with request"}
    if isinstance(request.args["player_name"], str) and isinstance(
        request.args["game_name"], str
    ):
        # logger.info("game_name: " + content["game_name"])
        # logger.info("player_name: " + content["player_name"])
        game = GM.refresh_game(
            request.args["game_name"].upper(), request.args["player_name"]
        )
        return GameData(game).get_json(), 200
    return answer, 400


@app.post("/six")
def turn_sixer():
    answer = {"error_msg": "Error with request"}
    if request.is_json:
        content = request.get_json()
        # logger.info("game_name: " + content["game_name"])
        # logger.info("player_name: " + content["player_name"])
        game = GM.turn_six(content["game_name"].upper(), content["player_name"])
        return GameData(game).get_json(), 200
    return answer, 400


if __name__ == "__main__":
    serve(app, host="0.0.0.0", port=8080)
