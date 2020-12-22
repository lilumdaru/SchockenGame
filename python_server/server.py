# Server Stub for Schocken app implementation:
# pylint: disable=E1101

from concurrent import futures
import logging
import grpc
import sys, os
sys.path.append(os.path.join(os.path.dirname(__file__), "gamelogic"))

from enum import Enum
from gamelogic.Logger import Logger
from rpc_lib import schocken_rpc_pb2
from rpc_lib import schocken_rpc_pb2_grpc

from gamelogic.GameManager import GameManager
from gamelogic.MyEnums import GameState, PlayerState

logger = Logger()

class SchockenConnector(schocken_rpc_pb2_grpc.SchockenConnector):
    GM = GameManager()

    def registerGame(self, request, context):
        logger.log("registerGame by: " + request.player_name)
        GameData = self.GM.register_game()
        newGame = schocken_rpc_pb2.GameID()
        newGame.game_name = GameData.game_name
        newGame.game_nr = GameData.game_id
        if(GameData.game_status == GameState.ERROR):
            newGame.game_nr = -1
            newGame.error_msg = GameData.message
        logger.log("GameData.game_name: " + GameData.game_name)
        return newGame

    def registerPlayer(self, request, context):
        logger.log("register Player: " + request.player_name +
              " for Game: " + request.game_name)
        GameData = self.GM.register_player(request.game_name.upper(), request.player_name)
        reg_res = schocken_rpc_pb2.RegistrationResponse()
        reg_res.return_value = 0
        reg_res.player_nr = 2
        reg_res.game_nr = GameData.game_id
        reg_res.error_msg = GameData.message
        if ( (GameData.game_status == GameState.ERROR ) ):
            reg_res.return_value = -1
        return reg_res

    def getPlayerList(self, request, context):
        logger.log("getPlayerList request. GameNr: " +
              str(request.game_nr) + " GameName: " + request.game_name)
        GameData = self.GM.get_player_list(request.game_name.upper())
        
        player_list = schocken_rpc_pb2.PlayerList()

        logger.log("GameData.game_status: " + str( GameData.game_status) )
        
        if(GameData.game_status == GameState.LOBBY):
            player_list.status = schocken_rpc_pb2.PlayerList.state.LOBBY
        elif(GameData.game_status == GameState.STARTING):
            player_list.status = schocken_rpc_pb2.PlayerList.state.STARTING
        else:
            player_list.status = schocken_rpc_pb2.PlayerList.state.ERROR
            logger.log("ERROR: GameData.message: " + GameData.message)
        for player in GameData.players:
            player_list.player_names.append(player.player_name)
            
        logger.log("player_list.status: " + str( player_list.status) )

        # logger.log("player_list.player_names: " + player_list.player_names)
        return player_list

    def startGame(self, request, context):
        logger.log("startGame request. GameNr: " +
              str(request.game_nr) + " GameName: " + request.game_name)
        GameData = self.GM.start_game(request.game_name.upper())

        start_game_resp = schocken_rpc_pb2.StartGameResponse()
        if(GameData.game_status == GameState.ERROR):
            start_game_resp.return_value = 1
            start_game_resp.error_msg = GameData.message
        else:
            start_game_resp.return_value = 0
            start_game_resp.error_msg = ""
        return start_game_resp

    def touchDice(self, request, context):
        logger.log("touchDice request. dice_id: " +
              str(request.dice_id) + " player_name: " + str(request.player_name) + " game_name: " + str(request.game_name))
        GameData = self.GM.touch_dice(request.game_name.upper(), request.player_name, request.dice_id)

        return self.convertGamedata(GameData)

    def touchCup(self, request, context):
        logger.log("touchCup player_nr: " + str(request.player_nr) + " game_nr: " + str(request.game_nr) +
              "player_name: " + str(request.player_name) + " game_name: " + str(request.game_name))
        GameData = self.GM.touch_cup(request.game_name.upper(), request.player_name)
        return self.convertGamedata(GameData)

    def endTurn(self, request, context):
        logger.log("endTurn player_nr: " + str(request.player_nr) + " game_nr: " + str(request.game_nr) +
              "player_name: " + str(request.player_name) + " game_name: " + str(request.game_name))
        GameData = self.GM.end_turn(request.game_name.upper(), request.player_name)
        return self.convertGamedata(GameData)

    def refreshGame(self, request, context):
        # logger.log("refreshGame player_nr: " + str(request.player_nr) + " game_nr: " + str(request.game_nr) +
        #       "player_name: " + str(request.player_name) + " game_name: " + str(request.game_name))
        GameData = self.GM.refresh_game(request.game_name.upper(), request.player_name)
        return self.convertGamedata(GameData)

    def turnSix(self, request, context):
        logger.log("turnSix player_nr: " + str(request.player_nr) + " game_nr: " + str(request.game_nr) +
              "player_name: " + str(request.player_name) + " game_name: " + str(request.game_name))
        GameData = self.GM.turn_six(request.game_name.upper(), request.player_name)
        return self.convertGamedata(GameData)

    def convertGamedata(self, gameData):
        rpc_game_data = schocken_rpc_pb2.RpcGameData()
        rpc_game_data.game_name = gameData.game_name

        for player in gameData.players:
            temp_player = schocken_rpc_pb2.RpcPlayer()
            temp_player.player_name = player.player_name

            if(player.player_status == PlayerState.ACTIVE):
                temp_player.player_status = schocken_rpc_pb2.RpcPlayer.player_state.ACTIVE
            elif(player.player_status == PlayerState.PASSIVE):
                temp_player.player_status = schocken_rpc_pb2.RpcPlayer.player_state.PASSIVE
            elif(player.player_status == PlayerState.SPEC):
                temp_player.player_status = schocken_rpc_pb2.RpcPlayer.player_state.SPEC
            elif(player.player_status == PlayerState.LEFT):
                temp_player.player_status = schocken_rpc_pb2.RpcPlayer.player_state.LEFT
            elif(player.player_status == PlayerState.ARRIVED):
                temp_player.player_status = schocken_rpc_pb2.RpcPlayer.player_state.OTHER
            elif(player.player_status == PlayerState.UNINITIALIZED):
                temp_player.player_status = schocken_rpc_pb2.RpcPlayer.player_state.OTHER
            else:
                temp_player.player_status = schocken_rpc_pb2.RpcPlayer.player_state.ERROR
            
            temp_player.harte = player.harte
            del temp_player.dice[:]
            temp_player.dice.extend(player.dices)
            rpc_game_data.players.append(temp_player)

        if(gameData.game_status == GameState.LOBBY):
            rpc_game_data.game_status = schocken_rpc_pb2.RpcGameData.game_state.LOBBY
        elif(gameData.game_status == GameState.STARTING):
            rpc_game_data.game_status = schocken_rpc_pb2.RpcGameData.game_state.STARTING
        elif(gameData.game_status == GameState.ENDED):
            rpc_game_data.game_status = schocken_rpc_pb2.RpcGameData.game_state.ENDED
        elif(gameData.game_status == GameState.RUNNING):
            rpc_game_data.game_status = schocken_rpc_pb2.RpcGameData.game_state.RUNNING
        elif(gameData.game_status == GameState.TIMEOUT):
            rpc_game_data.game_status = schocken_rpc_pb2.RpcGameData.game_state.TIMEOUT
        elif(gameData.game_status == GameState.ERROR):
            rpc_game_data.game_status = schocken_rpc_pb2.RpcGameData.game_state.ERROR
        else:
            rpc_game_data.game_status = schocken_rpc_pb2.RpcGameData.game_state.ERROR


        rpc_game_data.active_player.dice.extend([1, 2]) # todo delete later
        rpc_game_data.active_cup_up = True # todo delete later

        rpc_game_data.active_roll = gameData.active_roll
        rpc_game_data.max_rolls = gameData.max_rolls
        rpc_game_data.message = gameData.message
        rpc_game_data.button_turn_6 = gameData.turn_six_button

        return rpc_game_data


def serve():
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    schocken_rpc_pb2_grpc.add_SchockenConnectorServicer_to_server(
        SchockenConnector(), server)
    server.add_insecure_port('[::]:50051')
    logger.log("starting Server")
    server.start()
    server.wait_for_termination()


if __name__ == '__main__':
    logging.basicConfig()
    serve()
