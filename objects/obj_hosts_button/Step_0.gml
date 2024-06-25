if (should_i_try_to_join && !did_we_joined) {
	should_i_try_to_join = false;
	alarm[0] = 2 * game_get_speed(gamespeed_fps);
	
	var _data = ds_map_create();
	ds_map_add(_data, "host_number", local_host_number);
	ds_map_add(_data, "player_number", noone);
	send_player_over_udp(8080, 100, _data, MSG_TYPE.JOIN_HOST);
}