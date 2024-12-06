if (async_load[? "size"] > 0) {
	var _buff = async_load[? "buffer"];
	buffer_seek(_buff, buffer_seek_start, 0);
	var _message_id = buffer_read(_buff, buffer_string);
	
	var _response = json_decode(_message_id);
	
	if (ds_map_find_value(_response, "type") == MSG_TYPE.SAVE_PAINTING) {
		var _painting = buffer_base64_encode(buffer, 0, buffer_get_size(buffer));
		packet = ds_map_find_value(_response, "packet");
		
		if (ds_map_find_value(_response, "success") == true) {
			packet++;
		}
		
		if (packet > 6) {
			send_packet = false;
			global.gui_depth = 0;
			instance_destroy(save);
			instance_destroy(fade);
			instance_destroy(palette);
			instance_destroy(button1);
			instance_destroy(button2);
			instance_destroy(button3);
			instance_destroy(button4);
			instance_destroy(select_button);
			instance_destroy();
			global.minigame_running = false;
		} 
	}
}	