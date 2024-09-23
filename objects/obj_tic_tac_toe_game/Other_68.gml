if (async_load[? "size"] > 0) {
	var _buff = async_load[? "buffer"];
	buffer_seek(_buff, buffer_seek_start, 0);
	var _message_id = buffer_read(_buff, buffer_string);
	
	var _response = json_decode(_message_id);
	
	if (ds_map_find_value(_response, "type") == MSG_TYPE.GET_MINIGAMES || ds_map_find_value(_response, "type") == MSG_TYPE.SET_MINIGAMES) {
		show_debug_message("< " + _message_id);
		if (ds_map_find_value(_response, "minigame_id") == global.game) {
			player_win = ds_map_find_value(_response, "player_win");
			time = ds_map_find_value(ds_map_find_value(_response, "info"), "time");
			player_id_round = ds_map_find_value(ds_map_find_value(_response, "info"), "id");
			if (array_contains(global.players_in_minigame, player_win) || player_id_round == -4) {
				instance_destroy();
				global.minigame_running = false;
				global.lock = false;
				show_debug_message(string(player_win) + " venceu");
			}
			var _ds_p = ds_map_find_value(_response, "players_in_minigame");
			if (ds_map_find_value(_response, "players_in_minigame") != pointer_null) {
				for (var _i = 0; _i < ds_list_size(_ds_p); _i++) {
					array_set(global.players_in_minigame,  _i, ds_list_find_value(_ds_p, _i));
				}
			}
			if (ds_map_find_value(ds_map_find_value(_response, "info"), "data") != pointer_null) {
				var _ds = ds_map_find_value(ds_map_find_value(_response, "info"), "data");
				for (var _j = 0; _j < ds_list_size(_ds); _j++) {
					array_set(info,  _j, ds_list_find_value(_ds, _j));
				}
			}
		}
	}
}