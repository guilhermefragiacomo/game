if (async_load[? "size"] > 0) {
	var _buff = async_load[? "buffer"];
	buffer_seek(_buff, buffer_seek_start, 0);
	var _message_id = buffer_read(_buff, buffer_string);
	
	var _response = json_decode(_message_id);
	
	if (ds_map_find_value(_response, "type") == MSG_TYPE.CREATE_HOST) {
		show_debug_message("< " + _message_id);
		global.host_number = ds_map_find_value(_response, "hostNumber");
		global.player_number = ds_map_find_value(_response, "playerNumber");
		room_goto(rm_1);
	}
}	