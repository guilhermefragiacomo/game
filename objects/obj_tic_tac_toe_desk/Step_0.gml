if (global.show_gui == false) {
	if (should_i_get_new_players == true) {
		should_i_get_new_players = false;
	}
}

if (array_length(global.players_in_minigame) < player_limit) {
	if (global.game == minigame_id) {
		if (should_i_get_new_players) {
			should_i_get_new_players = false;
			alarm[0] = game_get_speed(gamespeed_fps) * 2;
		}
	}
}

if (array_length(global.players_in_minigame) == player_limit) {
	if (should_i_get_new_players) {
		should_i_get_new_players = false;
		global.counter = 3;
		alarm[1] = game_get_speed(gamespeed_fps) * 3;
	}
}