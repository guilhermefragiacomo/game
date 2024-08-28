if (should_i_receive_data) {
	should_i_receive_data = false;
	alarm[0] = game_get_speed(gamespeed_fps) / 2;
}