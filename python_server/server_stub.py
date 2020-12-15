# Server Stub for Schocken app implementation:
# pylint: disable=E1101

from concurrent import futures
import logging
import grpc

from rpc_lib import schocken_rpc_pb2
from rpc_lib import schocken_rpc_pb2_grpc


class SchockenConnector(schocken_rpc_pb2_grpc.SchockenConnector):
    #   rpc registerPlayer(PlayerInfo) returns (RegistrationResponse) {}
    #   //
    #   rpc getPlayerList(GameID) returns (PlayerList) {}
    #   // Host opening a new Game
    #   rpc registerGame(PlayerInfo) returns (GameID) {}
    #   // host action to Start the Game
    #   rpc startGame(GameID) returns (StartGameResponse) {}

    def registerPlayer(self, request, context):
        print("register Player: " + request.player_name +
              " for Game: " + request.game_name)
        reg_res = schocken_rpc_pb2.RegistrationResponse()
        reg_res.return_value = 0
        reg_res.player_nr = 2
        reg_res.game_nr = 45
        reg_res.error_msg = "registerPlayer empty errorMSG"
        if request.game_name.upper() != "blub".upper():
            reg_res.return_value = -1
            reg_res.error_msg = "registerPlayer Game doesn't exist!"

        reg_res.player_nr = 2
        reg_res.game_nr = 45
        return reg_res

    def getPlayerList(self, request, context):
        print("getPlayerList request. GameNr: " +
              str(request.game_nr) + " GameName: " + request.game_name)
        player_list = schocken_rpc_pb2.PlayerList()
        player_list.player_names.extend(
            ["Playername1", "Playername2", "Playername3", "Playername4"])
        player_list.status = schocken_rpc_pb2.PlayerList.state.LOBBY
        # player_list.status = schocken_rpc_pb2.PlayerList.state.STARTING
        for x in range(30):
            player_list.player_names.append("Playername" + str(x))
        # .extend(["Playername1", "Playername2"]) for lists
        # .append("Playername")
        return player_list

    def registerGame(self, request, context):
        print("registerGame by: " + request.player_name)
        newGame = schocken_rpc_pb2.GameID()
        newGame.game_name = "blub"
        newGame.game_nr = 13
        return newGame

    def startGame(self, request, context):
        print("getPlayerList request. GameNr: " +
              str(request.game_nr) + " GameName: " + request.game_name)
        start_game_resp = schocken_rpc_pb2.StartGameResponse()
        start_game_resp.return_value = 0
        start_game_resp.error_msg = ""
        return start_game_resp

    def touchDice(self, request, context):
        print("touchDice request. dice_id: " +
              str(request.dice_id) + " player_nr: " + str(request.player_nr) + " game_nr: " + str(request.game_nr))
        return self.getGameData()

    def touchCup(self, request, context):
        print("player_nr: " + str(request.player_nr) + " game_nr: " + str(request.game_nr) +
              "player_name: " + str(request.player_name) + " game_name: " + str(request.game_name))
        return self.getGameData()

    def endTurn(self, request, context):
        print("player_nr: " + str(request.player_nr) + " game_nr: " + str(request.game_nr) +
              "player_name: " + str(request.player_name) + " game_name: " + str(request.game_name))
        return self.getGameData()

    def refreshGame(self, request, context):
        print("player_nr: " + str(request.player_nr) + " game_nr: " + str(request.game_nr) +
              "player_name: " + str(request.player_name) + " game_name: " + str(request.game_name))
        return self.getGameData()

    def getGameData(self):
        rpc_game_data = schocken_rpc_pb2.RpcGameData()
        rpc_game_data.game_name = "BLUB"
        player1 = schocken_rpc_pb2.RpcPlayer()
        player1.player_name = "player1"
        player1.player_status = schocken_rpc_pb2.RpcPlayer.player_state.ACTIVE  # PASSIVE SPEC LEFT
        player1.harte = 4
        player1.dice.extend([2, 2, 2])
        rpc_game_data.players.append(player1)
        player2 = schocken_rpc_pb2.RpcPlayer()
        player2.player_name = "player2"
        player2.player_status = schocken_rpc_pb2.RpcPlayer.player_state.PASSIVE  # PASSIVE SPEC LEFT
        player2.harte = 8
        player2.dice.extend([1, 2, 3])
        rpc_game_data.players.append(player2)
        player3 = schocken_rpc_pb2.RpcPlayer()
        player3.player_name = "player3"
        player3.player_status = schocken_rpc_pb2.RpcPlayer.player_state.PASSIVE  # PASSIVE SPEC LEFT
        player3.harte = 1
        player3.dice.extend([1, 1])
        rpc_game_data.players.append(player3)
        player4 = schocken_rpc_pb2.RpcPlayer()
        player4.player_name = "player4"
        player4.player_status = schocken_rpc_pb2.RpcPlayer.player_state.PASSIVE  # PASSIVE SPEC LEFT
        player4.harte = 0
        player4.dice.extend([1, 2, 2])
        rpc_game_data.players.append(player4)
        rpc_game_data.game_status = schocken_rpc_pb2.RpcGameData.game_state.RUNNING
        rpc_game_data.active_player.dice.extend([1, 2])
        rpc_game_data.active_roll = 1
        rpc_game_data.max_rolls = 3
        rpc_game_data.active_cup_up = True
        rpc_game_data.game_name = "Spieler blah hat verloren!"

        return rpc_game_data


def serve():
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    schocken_rpc_pb2_grpc.add_SchockenConnectorServicer_to_server(
        SchockenConnector(), server)
    server.add_insecure_port('[::]:50051')
    print("starting Server")
    server.start()
    server.wait_for_termination()


if __name__ == '__main__':
    logging.basicConfig()
    serve()
