if (should_i_try_to_check_new_player) {
	should_i_try_to_check_new_player = false;
	alarm[0] = game_get_speed(gamespeed_fps) * 3;
	var _data = ds_map_create();
	ds_map_add(_data, "host_number", global.host_number);
	ds_map_add(_data, "players", noone);
	send_player_over_udp(8080, 200, _data, MSG_TYPE.GET_NEW_PLAYER);
}
if (check_for_disconnected_players) {
	check_for_disconnected_players = false;
	alarm[1] = game_get_speed(gamespeed_fps) * 6;
	var _data = ds_map_create();
	ds_map_add(_data, "host_number", global.host_number);
	ds_map_add(_data, "players", noone);
	send_player_over_udp(8080, 200, _data, MSG_TYPE.CHECK_DISCONNECTED);
}