if (async_load[? "size"] > 0) {
	var _buff = async_load[? "buffer"];
	buffer_seek(_buff, buffer_seek_start, 0);
	var _message_id = buffer_read(_buff, buffer_string);
	
	var _response = json_decode(_message_id);
	
	if (ds_map_find_value(_response, "type") == MSG_TYPE.GET_PLAYER_STAT) {
		show_debug_message("< " + _message_id);
		var _player_stat = ds_map_find_value(_response, "player_stat");
		var _pn = ds_map_find_value(_player_stat, "player_number");
		if (_pn == player_number) {
			move_x = ds_map_find_value(_player_stat, "move_x");
			move_y = ds_map_find_value(_player_stat, "move_y");
			x = ds_map_find_value(_player_stat, "x");
			y = ds_map_find_value(_player_stat, "y");
		}
	}
}	