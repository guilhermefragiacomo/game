if (!did_we_received_hosts && should_i_try_to_get_hosts) {
	should_i_try_to_get_hosts = false;
	alarm[0] = game_get_speed(gamespeed_fps) * 3;
	
	var _data = ds_map_create();
	ds_map_add(_data, "hosts", noone);
	send_player_over_udp(8080, 100, _data, MSG_TYPE.GET_HOSTS);
}