if (is_this_our_player) {
	input_check();
	connected = true;
	set_player_states();
	player_number = global.player_number;
} else {
	get_player_states();
}

movement_animation();