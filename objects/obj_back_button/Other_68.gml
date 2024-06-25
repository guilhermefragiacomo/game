if (async_load[? "size"] > 0) {
	var _buff = async_load[? "buffer"];
	buffer_seek(_buff, buffer_seek_start, 0);
	var _message_id = buffer_read(_buff, buffer_string);
	
	var _response = json_decode(_message_id);
	
	if (ds_map_find_value(_response, "type") == MSG_TYPE.STOP_HOST) {
		show_debug_message("< " + _message_id);
		var _res = ds_map_find_value(_response, "res");
		if (_res == "stopped") {
			is_host_stopeed = true;
			room_goto(rm_1);
		}
	}
}