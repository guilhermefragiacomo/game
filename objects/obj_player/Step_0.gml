if (is_this_our_player) {
	input_check();
	connected = true;
	set_player_states();
	player_number = global.player_number;
} else {
	get_player_states();
}

if (is_this_our_player) {
	if (!global.lock) {
		if (global.gui_depth == 0) {
			movement_animation();
		}
	}
} else {
	movement_animation();
}

if (keyboard_check_pressed(ord("F"))) {
	var _data = ds_map_create();
	ds_map_add(_data, "host_number", global.host_number);
	ds_map_add(_data, "player_number", player_number);
	send_player_over_udp(8080, 300, _data, MSG_TYPE.SAVE_PLAYER);
}