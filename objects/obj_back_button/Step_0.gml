if (should_host_stop && !is_host_stopeed) {
	should_host_stop = false;
	var _data = ds_map_create();
	ds_map_add(_data, "hostNumber", global.host_number);
	ds_map_add(_data, "res", noone);
	send_player_over_udp(8080, 100, _data, MSG_TYPE.STOP_HOST);
	alarm[0] = game_get_speed(gamespeed_fps) * 2;
}