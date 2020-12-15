@ECHO OFF

cd ..
protoc --dart_out=grpc:schocken_game/lib/rpc_lib -Iprotos schocken_rpc.proto

xcopy protos rpc_lib\
python -m grpc_tools.protoc -I. --python_out=python_server --grpc_python_out=python_server rpc_lib/schocken_rpc.proto
rmdir /s /q rpc_lib

PAUSE