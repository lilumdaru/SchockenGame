# SchockenGame

This is a virtual version of the pub game called "Schocken" or "Meier-Tod".

The client is written in Flutter and the server in python. REST is used as the interface.

The server will also provide a web app if no parameters are send with a get request.

## Build project

after installing flutter:

Execute in the projekt folder "schocken_game": `flutter build web`

copy the output of /build/web/ to /python_server/web/

## launch local

launch by executing the server with: `python server.py`

## deploy to azure

Choose an available app service name
1. Think of a name and replace YOURNAME in: https://YOURNAME.azurewebsites.net
2. Visit the page to check availability
3. If it can't be found, it's available. Save https://YOURNAME.azurewebsites.net (with Replacement) into "web/assets/env" as BACKEND_IP=https://YOURNAME.azurewebsites.net

Replace YOURNAME in command, check and adapt other parameters if necessary. Then Execute the command from the python project folder (see app.py; named in this repo "python_server"):
```
az webapp up --runtime "PYTHON:3.9" --sku B1 --name "YOURNAME" --location "West Europe" --resource-group "schocken" --os Linux --logs
```

After a few minutes, the web app is available.
