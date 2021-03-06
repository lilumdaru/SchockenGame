# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: rpc_lib/schocken_rpc.proto

from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()




DESCRIPTOR = _descriptor.FileDescriptor(
  name='rpc_lib/schocken_rpc.proto',
  package='',
  syntax='proto3',
  serialized_options=None,
  create_key=_descriptor._internal_create_key,
  serialized_pb=b'\n\x1arpc_lib/schocken_rpc.proto\"X\n\nPlayerInfo\x12\x13\n\x0bplayer_name\x18\x01 \x01(\t\x12\x11\n\tgame_name\x18\x02 \x01(\t\x12\x11\n\tplayer_nr\x18\x03 \x01(\x05\x12\x0f\n\x07game_nr\x18\x04 \x01(\x05\"c\n\x14RegistrationResponse\x12\x14\n\x0creturn_value\x18\x01 \x01(\x05\x12\x11\n\tplayer_nr\x18\x02 \x01(\x05\x12\x0f\n\x07game_nr\x18\x03 \x01(\x05\x12\x11\n\terror_msg\x18\x04 \x01(\t\"?\n\x06GameID\x12\x11\n\tgame_name\x18\x01 \x01(\t\x12\x0f\n\x07game_nr\x18\x02 \x01(\x05\x12\x11\n\terror_msg\x18\x03 \x01(\t\"\x97\x01\n\nPlayerList\x12\x14\n\x0cplayer_names\x18\x01 \x03(\t\x12!\n\x06status\x18\x02 \x01(\x0e\x32\x11.PlayerList.state\"P\n\x05state\x12\t\n\x05LOBBY\x10\x00\x12\x0c\n\x08STARTING\x10\x01\x12\x0b\n\x07RUNNING\x10\x02\x12\t\n\x05\x45NDED\x10\x03\x12\x0b\n\x07TIMEOUT\x10\x04\x12\t\n\x05\x45RROR\x10\x05\"\x07\n\x05\x45mpty\"<\n\x11StartGameResponse\x12\x14\n\x0creturn_value\x18\x01 \x01(\x05\x12\x11\n\terror_msg\x18\x02 \x01(\t\"j\n\x0b\x44iceTouched\x12\x0f\n\x07\x64ice_id\x18\x01 \x01(\x05\x12\x11\n\tplayer_nr\x18\x02 \x01(\x05\x12\x0f\n\x07game_nr\x18\x03 \x01(\x05\x12\x11\n\tgame_name\x18\x04 \x01(\t\x12\x13\n\x0bplayer_name\x18\x05 \x01(\t\"\xa7\x04\n\x0bRpcGameData\x12\x11\n\tgame_name\x18\x01 \x01(\t\x12\x1b\n\x07players\x18\x02 \x03(\x0b\x32\n.RpcPlayer\x12,\n\x0bgame_status\x18\x03 \x01(\x0e\x32\x17.RpcGameData.game_state\x12!\n\ractive_player\x18\x04 \x01(\x0b\x32\n.RpcPlayer\x12\x13\n\x0b\x61\x63tive_roll\x18\x05 \x01(\x05\x12\x11\n\tmax_rolls\x18\x06 \x01(\x05\x12\x15\n\ractive_cup_up\x18\x07 \x01(\x08\x12\x10\n\x08messages\x18\x08 \x03(\t\x12\x15\n\rbutton_turn_6\x18\t \x01(\x08\x12\x17\n\x0fgenerate_report\x18\n \x01(\x08\x12\x16\n\x0e\x64iscs_on_stack\x18\x0b \x01(\x05\x12\x11\n\terror_msg\x18\x0c \x01(\t\x12&\n\x05round\x18\r \x01(\x0e\x32\x17.RpcGameData.game_round\"U\n\ngame_state\x12\t\n\x05LOBBY\x10\x00\x12\x0c\n\x08STARTING\x10\x01\x12\x0b\n\x07RUNNING\x10\x02\x12\t\n\x05\x45NDED\x10\x03\x12\x0b\n\x07TIMEOUT\x10\x04\x12\t\n\x05\x45RROR\x10\x05\"l\n\ngame_round\x12\r\n\tROUND1_FH\x10\x00\x12\x0f\n\x0bROUND1_BACK\x10\x01\x12\r\n\tROUND2_FH\x10\x02\x12\x0f\n\x0bROUND2_BACK\x10\x03\x12\r\n\tFINALE_FH\x10\x04\x12\x0f\n\x0b\x46INALE_BACK\x10\x05\"\xc8\x01\n\tRpcPlayer\x12\x13\n\x0bplayer_name\x18\x01 \x01(\t\x12.\n\rplayer_status\x18\x02 \x01(\x0e\x32\x17.RpcPlayer.player_state\x12\r\n\x05harte\x18\x03 \x01(\x05\x12\x0c\n\x04\x64ice\x18\x04 \x03(\x05\x12\x11\n\tlost_half\x18\x05 \x01(\x08\"F\n\x0cplayer_state\x12\n\n\x06\x41\x43TIVE\x10\x00\x12\x0b\n\x07PASSIVE\x10\x01\x12\x08\n\x04SPEC\x10\x02\x12\x08\n\x04LEFT\x10\x03\x12\t\n\x05OTHER\x10\x04\x32\x9c\x03\n\x11SchockenConnector\x12\x36\n\x0eregisterPlayer\x12\x0b.PlayerInfo\x1a\x15.RegistrationResponse\"\x00\x12+\n\rgetPlayerList\x12\x0b.PlayerInfo\x1a\x0b.PlayerList\"\x00\x12&\n\x0cregisterGame\x12\x0b.PlayerInfo\x1a\x07.GameID\"\x00\x12*\n\tstartGame\x12\x07.GameID\x1a\x12.StartGameResponse\"\x00\x12)\n\ttouchDice\x12\x0c.DiceTouched\x1a\x0c.RpcGameData\"\x00\x12\'\n\x08touchCup\x12\x0b.PlayerInfo\x1a\x0c.RpcGameData\"\x00\x12&\n\x07turnSix\x12\x0b.PlayerInfo\x1a\x0c.RpcGameData\"\x00\x12&\n\x07\x65ndTurn\x12\x0b.PlayerInfo\x1a\x0c.RpcGameData\"\x00\x12*\n\x0brefreshGame\x12\x0b.PlayerInfo\x1a\x0c.RpcGameData\"\x00\x62\x06proto3'
)



_PLAYERLIST_STATE = _descriptor.EnumDescriptor(
  name='state',
  full_name='PlayerList.state',
  filename=None,
  file=DESCRIPTOR,
  create_key=_descriptor._internal_create_key,
  values=[
    _descriptor.EnumValueDescriptor(
      name='LOBBY', index=0, number=0,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='STARTING', index=1, number=1,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='RUNNING', index=2, number=2,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='ENDED', index=3, number=3,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='TIMEOUT', index=4, number=4,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='ERROR', index=5, number=5,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
  ],
  containing_type=None,
  serialized_options=None,
  serialized_start=358,
  serialized_end=438,
)
_sym_db.RegisterEnumDescriptor(_PLAYERLIST_STATE)

_RPCGAMEDATA_GAME_STATE = _descriptor.EnumDescriptor(
  name='game_state',
  full_name='RpcGameData.game_state',
  filename=None,
  file=DESCRIPTOR,
  create_key=_descriptor._internal_create_key,
  values=[
    _descriptor.EnumValueDescriptor(
      name='LOBBY', index=0, number=0,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='STARTING', index=1, number=1,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='RUNNING', index=2, number=2,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='ENDED', index=3, number=3,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='TIMEOUT', index=4, number=4,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='ERROR', index=5, number=5,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
  ],
  containing_type=None,
  serialized_options=None,
  serialized_start=976,
  serialized_end=1061,
)
_sym_db.RegisterEnumDescriptor(_RPCGAMEDATA_GAME_STATE)

_RPCGAMEDATA_GAME_ROUND = _descriptor.EnumDescriptor(
  name='game_round',
  full_name='RpcGameData.game_round',
  filename=None,
  file=DESCRIPTOR,
  create_key=_descriptor._internal_create_key,
  values=[
    _descriptor.EnumValueDescriptor(
      name='ROUND1_FH', index=0, number=0,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='ROUND1_BACK', index=1, number=1,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='ROUND2_FH', index=2, number=2,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='ROUND2_BACK', index=3, number=3,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='FINALE_FH', index=4, number=4,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='FINALE_BACK', index=5, number=5,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
  ],
  containing_type=None,
  serialized_options=None,
  serialized_start=1063,
  serialized_end=1171,
)
_sym_db.RegisterEnumDescriptor(_RPCGAMEDATA_GAME_ROUND)

_RPCPLAYER_PLAYER_STATE = _descriptor.EnumDescriptor(
  name='player_state',
  full_name='RpcPlayer.player_state',
  filename=None,
  file=DESCRIPTOR,
  create_key=_descriptor._internal_create_key,
  values=[
    _descriptor.EnumValueDescriptor(
      name='ACTIVE', index=0, number=0,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='PASSIVE', index=1, number=1,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='SPEC', index=2, number=2,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='LEFT', index=3, number=3,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='OTHER', index=4, number=4,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
  ],
  containing_type=None,
  serialized_options=None,
  serialized_start=1304,
  serialized_end=1374,
)
_sym_db.RegisterEnumDescriptor(_RPCPLAYER_PLAYER_STATE)


_PLAYERINFO = _descriptor.Descriptor(
  name='PlayerInfo',
  full_name='PlayerInfo',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='player_name', full_name='PlayerInfo.player_name', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='game_name', full_name='PlayerInfo.game_name', index=1,
      number=2, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='player_nr', full_name='PlayerInfo.player_nr', index=2,
      number=3, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='game_nr', full_name='PlayerInfo.game_nr', index=3,
      number=4, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=30,
  serialized_end=118,
)


_REGISTRATIONRESPONSE = _descriptor.Descriptor(
  name='RegistrationResponse',
  full_name='RegistrationResponse',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='return_value', full_name='RegistrationResponse.return_value', index=0,
      number=1, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='player_nr', full_name='RegistrationResponse.player_nr', index=1,
      number=2, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='game_nr', full_name='RegistrationResponse.game_nr', index=2,
      number=3, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='error_msg', full_name='RegistrationResponse.error_msg', index=3,
      number=4, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=120,
  serialized_end=219,
)


_GAMEID = _descriptor.Descriptor(
  name='GameID',
  full_name='GameID',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='game_name', full_name='GameID.game_name', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='game_nr', full_name='GameID.game_nr', index=1,
      number=2, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='error_msg', full_name='GameID.error_msg', index=2,
      number=3, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=221,
  serialized_end=284,
)


_PLAYERLIST = _descriptor.Descriptor(
  name='PlayerList',
  full_name='PlayerList',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='player_names', full_name='PlayerList.player_names', index=0,
      number=1, type=9, cpp_type=9, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='status', full_name='PlayerList.status', index=1,
      number=2, type=14, cpp_type=8, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
    _PLAYERLIST_STATE,
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=287,
  serialized_end=438,
)


_EMPTY = _descriptor.Descriptor(
  name='Empty',
  full_name='Empty',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=440,
  serialized_end=447,
)


_STARTGAMERESPONSE = _descriptor.Descriptor(
  name='StartGameResponse',
  full_name='StartGameResponse',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='return_value', full_name='StartGameResponse.return_value', index=0,
      number=1, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='error_msg', full_name='StartGameResponse.error_msg', index=1,
      number=2, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=449,
  serialized_end=509,
)


_DICETOUCHED = _descriptor.Descriptor(
  name='DiceTouched',
  full_name='DiceTouched',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='dice_id', full_name='DiceTouched.dice_id', index=0,
      number=1, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='player_nr', full_name='DiceTouched.player_nr', index=1,
      number=2, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='game_nr', full_name='DiceTouched.game_nr', index=2,
      number=3, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='game_name', full_name='DiceTouched.game_name', index=3,
      number=4, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='player_name', full_name='DiceTouched.player_name', index=4,
      number=5, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=511,
  serialized_end=617,
)


_RPCGAMEDATA = _descriptor.Descriptor(
  name='RpcGameData',
  full_name='RpcGameData',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='game_name', full_name='RpcGameData.game_name', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='players', full_name='RpcGameData.players', index=1,
      number=2, type=11, cpp_type=10, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='game_status', full_name='RpcGameData.game_status', index=2,
      number=3, type=14, cpp_type=8, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='active_player', full_name='RpcGameData.active_player', index=3,
      number=4, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='active_roll', full_name='RpcGameData.active_roll', index=4,
      number=5, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='max_rolls', full_name='RpcGameData.max_rolls', index=5,
      number=6, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='active_cup_up', full_name='RpcGameData.active_cup_up', index=6,
      number=7, type=8, cpp_type=7, label=1,
      has_default_value=False, default_value=False,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='messages', full_name='RpcGameData.messages', index=7,
      number=8, type=9, cpp_type=9, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='button_turn_6', full_name='RpcGameData.button_turn_6', index=8,
      number=9, type=8, cpp_type=7, label=1,
      has_default_value=False, default_value=False,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='generate_report', full_name='RpcGameData.generate_report', index=9,
      number=10, type=8, cpp_type=7, label=1,
      has_default_value=False, default_value=False,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='discs_on_stack', full_name='RpcGameData.discs_on_stack', index=10,
      number=11, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='error_msg', full_name='RpcGameData.error_msg', index=11,
      number=12, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='round', full_name='RpcGameData.round', index=12,
      number=13, type=14, cpp_type=8, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
    _RPCGAMEDATA_GAME_STATE,
    _RPCGAMEDATA_GAME_ROUND,
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=620,
  serialized_end=1171,
)


_RPCPLAYER = _descriptor.Descriptor(
  name='RpcPlayer',
  full_name='RpcPlayer',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='player_name', full_name='RpcPlayer.player_name', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='player_status', full_name='RpcPlayer.player_status', index=1,
      number=2, type=14, cpp_type=8, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='harte', full_name='RpcPlayer.harte', index=2,
      number=3, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='dice', full_name='RpcPlayer.dice', index=3,
      number=4, type=5, cpp_type=1, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='lost_half', full_name='RpcPlayer.lost_half', index=4,
      number=5, type=8, cpp_type=7, label=1,
      has_default_value=False, default_value=False,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
    _RPCPLAYER_PLAYER_STATE,
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=1174,
  serialized_end=1374,
)

_PLAYERLIST.fields_by_name['status'].enum_type = _PLAYERLIST_STATE
_PLAYERLIST_STATE.containing_type = _PLAYERLIST
_RPCGAMEDATA.fields_by_name['players'].message_type = _RPCPLAYER
_RPCGAMEDATA.fields_by_name['game_status'].enum_type = _RPCGAMEDATA_GAME_STATE
_RPCGAMEDATA.fields_by_name['active_player'].message_type = _RPCPLAYER
_RPCGAMEDATA.fields_by_name['round'].enum_type = _RPCGAMEDATA_GAME_ROUND
_RPCGAMEDATA_GAME_STATE.containing_type = _RPCGAMEDATA
_RPCGAMEDATA_GAME_ROUND.containing_type = _RPCGAMEDATA
_RPCPLAYER.fields_by_name['player_status'].enum_type = _RPCPLAYER_PLAYER_STATE
_RPCPLAYER_PLAYER_STATE.containing_type = _RPCPLAYER
DESCRIPTOR.message_types_by_name['PlayerInfo'] = _PLAYERINFO
DESCRIPTOR.message_types_by_name['RegistrationResponse'] = _REGISTRATIONRESPONSE
DESCRIPTOR.message_types_by_name['GameID'] = _GAMEID
DESCRIPTOR.message_types_by_name['PlayerList'] = _PLAYERLIST
DESCRIPTOR.message_types_by_name['Empty'] = _EMPTY
DESCRIPTOR.message_types_by_name['StartGameResponse'] = _STARTGAMERESPONSE
DESCRIPTOR.message_types_by_name['DiceTouched'] = _DICETOUCHED
DESCRIPTOR.message_types_by_name['RpcGameData'] = _RPCGAMEDATA
DESCRIPTOR.message_types_by_name['RpcPlayer'] = _RPCPLAYER
_sym_db.RegisterFileDescriptor(DESCRIPTOR)

PlayerInfo = _reflection.GeneratedProtocolMessageType('PlayerInfo', (_message.Message,), {
  'DESCRIPTOR' : _PLAYERINFO,
  '__module__' : 'rpc_lib.schocken_rpc_pb2'
  # @@protoc_insertion_point(class_scope:PlayerInfo)
  })
_sym_db.RegisterMessage(PlayerInfo)

RegistrationResponse = _reflection.GeneratedProtocolMessageType('RegistrationResponse', (_message.Message,), {
  'DESCRIPTOR' : _REGISTRATIONRESPONSE,
  '__module__' : 'rpc_lib.schocken_rpc_pb2'
  # @@protoc_insertion_point(class_scope:RegistrationResponse)
  })
_sym_db.RegisterMessage(RegistrationResponse)

GameID = _reflection.GeneratedProtocolMessageType('GameID', (_message.Message,), {
  'DESCRIPTOR' : _GAMEID,
  '__module__' : 'rpc_lib.schocken_rpc_pb2'
  # @@protoc_insertion_point(class_scope:GameID)
  })
_sym_db.RegisterMessage(GameID)

PlayerList = _reflection.GeneratedProtocolMessageType('PlayerList', (_message.Message,), {
  'DESCRIPTOR' : _PLAYERLIST,
  '__module__' : 'rpc_lib.schocken_rpc_pb2'
  # @@protoc_insertion_point(class_scope:PlayerList)
  })
_sym_db.RegisterMessage(PlayerList)

Empty = _reflection.GeneratedProtocolMessageType('Empty', (_message.Message,), {
  'DESCRIPTOR' : _EMPTY,
  '__module__' : 'rpc_lib.schocken_rpc_pb2'
  # @@protoc_insertion_point(class_scope:Empty)
  })
_sym_db.RegisterMessage(Empty)

StartGameResponse = _reflection.GeneratedProtocolMessageType('StartGameResponse', (_message.Message,), {
  'DESCRIPTOR' : _STARTGAMERESPONSE,
  '__module__' : 'rpc_lib.schocken_rpc_pb2'
  # @@protoc_insertion_point(class_scope:StartGameResponse)
  })
_sym_db.RegisterMessage(StartGameResponse)

DiceTouched = _reflection.GeneratedProtocolMessageType('DiceTouched', (_message.Message,), {
  'DESCRIPTOR' : _DICETOUCHED,
  '__module__' : 'rpc_lib.schocken_rpc_pb2'
  # @@protoc_insertion_point(class_scope:DiceTouched)
  })
_sym_db.RegisterMessage(DiceTouched)

RpcGameData = _reflection.GeneratedProtocolMessageType('RpcGameData', (_message.Message,), {
  'DESCRIPTOR' : _RPCGAMEDATA,
  '__module__' : 'rpc_lib.schocken_rpc_pb2'
  # @@protoc_insertion_point(class_scope:RpcGameData)
  })
_sym_db.RegisterMessage(RpcGameData)

RpcPlayer = _reflection.GeneratedProtocolMessageType('RpcPlayer', (_message.Message,), {
  'DESCRIPTOR' : _RPCPLAYER,
  '__module__' : 'rpc_lib.schocken_rpc_pb2'
  # @@protoc_insertion_point(class_scope:RpcPlayer)
  })
_sym_db.RegisterMessage(RpcPlayer)



_SCHOCKENCONNECTOR = _descriptor.ServiceDescriptor(
  name='SchockenConnector',
  full_name='SchockenConnector',
  file=DESCRIPTOR,
  index=0,
  serialized_options=None,
  create_key=_descriptor._internal_create_key,
  serialized_start=1377,
  serialized_end=1789,
  methods=[
  _descriptor.MethodDescriptor(
    name='registerPlayer',
    full_name='SchockenConnector.registerPlayer',
    index=0,
    containing_service=None,
    input_type=_PLAYERINFO,
    output_type=_REGISTRATIONRESPONSE,
    serialized_options=None,
    create_key=_descriptor._internal_create_key,
  ),
  _descriptor.MethodDescriptor(
    name='getPlayerList',
    full_name='SchockenConnector.getPlayerList',
    index=1,
    containing_service=None,
    input_type=_PLAYERINFO,
    output_type=_PLAYERLIST,
    serialized_options=None,
    create_key=_descriptor._internal_create_key,
  ),
  _descriptor.MethodDescriptor(
    name='registerGame',
    full_name='SchockenConnector.registerGame',
    index=2,
    containing_service=None,
    input_type=_PLAYERINFO,
    output_type=_GAMEID,
    serialized_options=None,
    create_key=_descriptor._internal_create_key,
  ),
  _descriptor.MethodDescriptor(
    name='startGame',
    full_name='SchockenConnector.startGame',
    index=3,
    containing_service=None,
    input_type=_GAMEID,
    output_type=_STARTGAMERESPONSE,
    serialized_options=None,
    create_key=_descriptor._internal_create_key,
  ),
  _descriptor.MethodDescriptor(
    name='touchDice',
    full_name='SchockenConnector.touchDice',
    index=4,
    containing_service=None,
    input_type=_DICETOUCHED,
    output_type=_RPCGAMEDATA,
    serialized_options=None,
    create_key=_descriptor._internal_create_key,
  ),
  _descriptor.MethodDescriptor(
    name='touchCup',
    full_name='SchockenConnector.touchCup',
    index=5,
    containing_service=None,
    input_type=_PLAYERINFO,
    output_type=_RPCGAMEDATA,
    serialized_options=None,
    create_key=_descriptor._internal_create_key,
  ),
  _descriptor.MethodDescriptor(
    name='turnSix',
    full_name='SchockenConnector.turnSix',
    index=6,
    containing_service=None,
    input_type=_PLAYERINFO,
    output_type=_RPCGAMEDATA,
    serialized_options=None,
    create_key=_descriptor._internal_create_key,
  ),
  _descriptor.MethodDescriptor(
    name='endTurn',
    full_name='SchockenConnector.endTurn',
    index=7,
    containing_service=None,
    input_type=_PLAYERINFO,
    output_type=_RPCGAMEDATA,
    serialized_options=None,
    create_key=_descriptor._internal_create_key,
  ),
  _descriptor.MethodDescriptor(
    name='refreshGame',
    full_name='SchockenConnector.refreshGame',
    index=8,
    containing_service=None,
    input_type=_PLAYERINFO,
    output_type=_RPCGAMEDATA,
    serialized_options=None,
    create_key=_descriptor._internal_create_key,
  ),
])
_sym_db.RegisterServiceDescriptor(_SCHOCKENCONNECTOR)

DESCRIPTOR.services_by_name['SchockenConnector'] = _SCHOCKENCONNECTOR

# @@protoc_insertion_point(module_scope)
