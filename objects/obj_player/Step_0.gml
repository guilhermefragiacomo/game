if (is_this_our_player) {
	input_check();
	set_player_states();
	player_number = global.player_number;
} else {
	get_player_states();
}

movement_animation();