var _data = ds_map_create();
	
ds_map_add(_data, "minigame_id", minigame_id);
ds_map_add(_data, "players_in_minigame", []);
ds_map_add(_data, "info", pointer_null);
ds_map_add(_data, "player_win", -1);
	
send_player_over_udp(8080, 1000, _data, MSG_TYPE.GET_MINIGAMES);
should_i_get_new_players = true;