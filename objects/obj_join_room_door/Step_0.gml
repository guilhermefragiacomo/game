if (should_i_try_to_join && !did_we_joined) {
	should_i_try_to_join = false;
	alarm[0] = 2 * game_get_speed(gamespeed_fps);
	
	/*
	var _data1 = ds_map_create();
	ds_map_add(_data1, "host_number", global.host_number);
	ds_map_add(_data1, "player_number", global.player_number);
	send_player_over_udp(8080, 100, _data1, MSG_TYPE.DISCONNECT);
	*/
	
	var _data = ds_map_create();
	ds_map_add(_data, "host_number", local_host_number);
	ds_map_add(_data, "player_number", global.player_number);
	ds_map_add(_data, "player_name", global.player_name);
	send_player_over_udp(8080, 100, _data, MSG_TYPE.JOIN_HOST);
}