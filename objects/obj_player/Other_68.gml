if (async_load[? "size"] > 0) {
	var _buff = async_load[? "buffer"];
	buffer_seek(_buff, buffer_seek_start, 0);
	var _message_id = buffer_read(_buff, buffer_string);
	
	var _response = json_decode(_message_id);
	
	if (ds_map_find_value(_response, "type") == MSG_TYPE.GET_PLAYER_STAT) {
		show_debug_message("< " + _message_id);
		var _player_stat = ds_map_find_value(_response, "player_stat");
		if (!is_this_our_player) {
			if (_player_stat != -4) {
				var _pn = ds_map_find_value(_player_stat, "player_number");
				if (_pn == player_number) {
					move_x = ds_map_find_value(_player_stat, "move_x");
					move_y = ds_map_find_value(_player_stat, "move_y");
					x = ds_map_find_value(_player_stat, "x");
					y = ds_map_find_value(_player_stat, "y");
				}
			} else {
				show_debug_message("\n\ndeletei alguem\n\n");
				instance_destroy();
			}
		}
	}
	
	if (ds_map_find_value(_response, "type") == MSG_TYPE.DISCONNECT) {
		show_debug_message("< " + _message_id);
		show_debug_message("\nRecebi a requisição disconnect\n");
		if (ds_map_find_value(_response, "host_number") == global.host_number) {
			if (player_number == ds_map_find_value(_response, "player_number")) {
				show_debug_message("\n\nesse é o cara que eu apaguei: " + string(player_number) + " - " + string(global.host_number) + "\n");
				instance_destroy();
			}
		}
	}
}	