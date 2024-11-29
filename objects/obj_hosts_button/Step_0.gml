if (should_i_try_to_join && !did_we_joined) {
	should_i_try_to_join = false;
	alarm[0] = 2 * game_get_speed(gamespeed_fps);
	
	var _data = ds_map_create();
	ds_map_add(_data, "host_number", local_host_number);
	ds_map_add(_data, "player_number", global.player_number);
	ds_map_add(_data, "player_name", global.player_name);
	ds_map_add(_data, "joined", did_we_joined);
	send_player_over_udp(8080, 150, _data, MSG_TYPE.JOIN_HOST);
}

if (did_we_joined) {
	room_goto(rm_1);
}