if (async_load[? "size"] > 0) {
	var _buff = async_load[? "buffer"];
	buffer_seek(_buff, buffer_seek_start, 0);
	var _message_id = buffer_read(_buff, buffer_string);
	
	var _response = json_decode(_message_id);
	
	if (ds_map_find_value(_response, "type") == MSG_TYPE.SET_MINIGAMES || ds_map_find_value(_response, "type") == MSG_TYPE.GET_MINIGAMES) {
		show_debug_message("< " + _message_id);
		var _minigames = ds_map_find_value(_response, "players_in_minigame");
		if (ds_map_find_value(_response, "minigame_id") == minigame_id) {
			if (global.game == minigame_id) {
				for (var _i = 0; _i < ds_list_size(_minigames); _i++) {
					if (!array_contains(global.players_in_minigame, ds_list_find_value(_minigames, _i))) {
						array_push(global.players_in_minigame, ds_list_find_value(_minigames, _i));
					}
				}
				for (var _j = 0; _j < array_length(global.players_in_minigame); _j++) {
					if (ds_list_find_index(_minigames, array_get(global.players_in_minigame, _j)) == -1) {
						array_delete(global.players_in_minigame, _j, 1);
					}
				}
			}
		}
	}
	
	if (ds_map_find_value(_response, "type") == MSG_TYPE.START_MINIGAME) {
		show_debug_message("< " + _message_id);
		var _minigames = ds_map_find_value(_response, "players_in_minigame");
		if (ds_map_find_value(_response, "minigame_id") == minigame_id) {
			if (global.game == minigame_id) {
				if (ds_list_size(_minigames) == player_limit) {
					global.show_gui = false;
					global.minigame_running = true;
					var _inst = instance_create_depth(1, 1, -200, obj_fade_gui);
					var _game = instance_create_depth(0,0, -200, obj_tic_tac_toe_game);
				} else {
					start = true;
				}
			}
		}
	}
}	