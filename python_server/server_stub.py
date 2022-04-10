# Server Stub for Schocken app implementation:
# pylint: disable=E1101

import logging
from flask import Flask, request, jsonify
from waitress import serve

app = Flask(__name__)


logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


countries = [
    {"id": 1, "name": "Thailand", "capital": "Bangkok", "area": 513120},
    {"id": 2, "name": "Australia", "capital": "Canberra", "area": 7617930},
    {"id": 3, "name": "Egypt", "capital": "Cairo", "area": 1010408},
]


@app.post("/countries")
def add_country():
    if request.is_json:
        country = request.get_json()
        country["id"] = 0
        countries.append(country)
        return country, 201
    return {"error": "Request must be JSON"}, 415


@app.post("/register_game")
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


@app.post("/register_player")
def register_player():
    answer = {"player_nr": 0, "game_id": 0, "error_msg": "Error with request"}
    if request.is_json:
        content = request.get_json()
        logger.info(content["player_name"], content["game_name"])
        answer["game_id"] = 1
        answer["player_nr"] = 1
        answer["error_msg"] = ""
        return answer, 200
    return answer, 400


if __name__ == "__main__":
    serve(app, host="0.0.0.0", port=8080)
