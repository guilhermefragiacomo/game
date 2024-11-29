if (async_load[? "size"] > 0) {
	var _buff = async_load[? "buffer"];
	buffer_seek(_buff, buffer_seek_start, 0);
	var _message_id = buffer_read(_buff, buffer_string);
	
	var _response = json_decode(_message_id);
	
	if (ds_map_find_value(_response, "type") == MSG_TYPE.JOIN_HOST) {
		show_debug_message("< " + _message_id);
		did_we_joined = ds_map_find_value(_response, "joined");
		if (did_we_joined) {
			global.player_number = ds_map_find_value(_response, "player_number");
			global.host_number = ds_map_find_value(_response, "host_number");
		}
	}
}