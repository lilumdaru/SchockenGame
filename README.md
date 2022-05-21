# SchockenGame

This is a virtual version of the pub game called "Schocken" or "Meier-Tod".

The client is written in Flutter and the server in python. REST is used as the interface.

The server will also provide a web app if no parameters are send with a get request.

## Build project

after installing flutter:

Execute in the projekt folder "schocken_game": flutter build web

copy the output of /build/web/ to /python_server/web/

## launch local

launch by executing the server with: python server.py