var _data = ds_map_create();
	
ds_map_add(_data, "minigame_id", minigame_id);
ds_map_add(_data, "players_in_minigame", []);
	
send_player_over_udp(8080, 1000, _data, MSG_TYPE.START_MINIGAME);
