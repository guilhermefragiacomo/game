if (async_load[? "size"] > 0) {
	var _buff = async_load[? "buffer"];
	buffer_seek(_buff, buffer_seek_start, 0);
	var _message_id = buffer_read(_buff, buffer_string);
	
	var _response = json_decode(_message_id);
	
	if (ds_map_find_value(_response, "type") == MSG_TYPE.GET_MINIGAMES) {
		show_debug_message("< " + _message_id);
		var _minigames = ds_map_find_value(_response, "players_in_minigame");
		if (ds_map_find_value(_response, "minigame_id") == global.game) {
			time = ds_map_find_value(ds_map_find_value(_response, "info"), "time");
			player_id_round = ds_map_find_value(ds_map_find_value(_response, "info"), "id");
		}
	}
}