var _data = ds_map_create();

ds_map_add(_data, "hostNumber", noone);
ds_map_add(_data, "playerNumber", noone);

send_player_over_udp(8080, 100, _data, MSG_TYPE.CREATE_HOST);