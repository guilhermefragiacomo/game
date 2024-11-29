if (async_load[? "size"] > 0) {
	var _buff = async_load[? "buffer"];
	buffer_seek(_buff, buffer_seek_start, 0);
	var _message_id = buffer_read(_buff, buffer_string);
	
	var _response = json_decode(_message_id);
	
	if (ds_map_find_value(_response, "type") == MSG_TYPE.GET_MINIGAMES || ds_map_find_value(_response, "type") == MSG_TYPE.SET_MINIGAMES) {
		show_debug_message("< " + _message_id);
		if (ds_map_find_value(_response, "minigame_id") == global.game) {
			player_win = ds_map_find_value(_response, "player_win");
			var _dsds = ds_map_find_value(_response, "info");
			show_debug_message(string(_dsds));
			if (!is_undefined(_dsds)) {
				time = ds_map_find_value(ds_map_find_value(_response, "info"), "time");
				player_id_round = ds_map_find_value(ds_map_find_value(_response, "info"), "id");
			}
			var _ds_p = ds_map_find_value(_response, "players_in_minigame");
			if (!is_undefined(ds_map_find_value(_response, "players_in_minigame"))) {
				for (var _i = 0; _i < ds_list_size(_ds_p); _i++) {
					array_set(global.players_in_minigame,  _i, ds_list_find_value(_ds_p, _i));
				}
			}
			if (!is_undefined(ds_map_find_value(_response, "info"))) {
				var _ds = ds_map_find_value(ds_map_find_value(_response, "info"), "data");
				for (var _j = 0; _j < ds_list_size(_ds); _j++) {
					array_set(info,  _j, ds_list_find_value(_ds, _j));
				}
			}
			if (array_contains(global.players_in_minigame, player_win) || player_id_round == -4) {
				global.minigame_running = false;
				global.lock = false;
				global.player_limit = 0;
				global.game = -1;
				global.players_in_minigame = [];
				global.counter = 0;
				global.gui_depth = 0;
				show_debug_message(string(player_win) + " venceu");
				instance_destroy(fade);
				instance_destroy();
			}
		}
	}
}