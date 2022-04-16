# Server Stub for Schocken app implementation:
# pylint: disable=E1101

import logging
from flask import Flask, request, jsonify
from waitress import serve

from interface.game_status import GameStatus

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
        "status": GameStatus.ERROR,  # "LOBBY", "STARTING", "ERROR",
        "player_names": [],
        "error_msg": "Error with request",
    }

    if isinstance(request.args["player_name"], str) and isinstance(
        request.args["game_name"], str
    ):
        logger.info("player_name: " + request.args["player_name"])
        logger.info("game_name: " + request.args["game_name"])
        answer["player_names"] = ["player_name1", "player_name2"]
        answer["status"] = GameStatus.LOBBY
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


if __name__ == "__main__":
    serve(app, host="0.0.0.0", port=8080)
