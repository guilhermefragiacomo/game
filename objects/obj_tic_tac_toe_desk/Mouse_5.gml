if (array_length(global.players_in_minigame) <= player_limit) {
	global.show_gui = true;
	global.game = minigame_id;
	global.player_limit = player_limit;
	global.lock = true;
	
	var _gui = instance_create_depth(0,0, -200, obj_waiting_for_players);
	var _close = instance_create_depth(1142,572 , -200, obj_close_gui_button);
	
	if (!array_contains(global.players_in_minigame, global.player_number)) {
		array_push(global.players_in_minigame, global.player_number);
		
		var _data = ds_map_create();
	
		ds_map_add(_data, "minigame_id", minigame_id);
		ds_map_add(_data, "players_in_minigame", global.players_in_minigame);
	
		send_player_over_udp(8080, 1000, _data, MSG_TYPE.SET_MINIGAMES);
	}
		
	should_i_get_new_players = true;
	start = true;
}