if (async_load[? "size"] > 0) {
	var _buff = async_load[? "buffer"];
	buffer_seek(_buff, buffer_seek_start, 0);
	var _message_id = buffer_read(_buff, buffer_string);
	
	var _players;
	var _player;
	
	var _response = json_decode(_message_id);
	if (ds_map_find_value(_response, "type") == MSG_TYPE.CHECK_DISCONNECTED) {
		show_debug_message("< " + _message_id);
		_players = ds_map_find_value(_response, "players");
		for (var _i = 0; _i < ds_list_size(_players); _i++) {
			_player = ds_list_find_value(_players, _i);
			if (!ds_map_find_value(_player, "connected")) {
				var _number_of_player_already_in_level = instance_number(obj_player);
				if (_number_of_player_already_in_level > 0) {
					for (var _k = 0; _k < _number_of_player_already_in_level; ++_k) {
					    var _ext_player = instance_find(obj_player, _k);
						if (_ext_player.player_number == ds_map_find_value(_player, "player_number")) {
							show_debug_message("\n\nesse é o cara que eu apaguei da existencia: " + string(_ext_player.player_number) + "\n");
							instance_destroy(_ext_player);
							_number_of_player_already_in_level = instance_number(obj_player);
						}
					}
				}
			}
		}
	}
	
	if (ds_map_find_value(_response, "type") == MSG_TYPE.GET_NEW_PLAYER) {
		show_debug_message("< " + _message_id);
		_players = ds_map_find_value(_response, "players");
		
		var _number_of_player_already_in_level = instance_number(obj_player);
		if (_number_of_player_already_in_level > 0) {
			for (var _i = 0; _i < _number_of_player_already_in_level; ++_i) {
			    var _ext_player = instance_find(obj_player, _i);
				var _number_of_players = ds_list_size(_players);
				for (var _g = 0; _g < _number_of_players; ++_g) {
				    _player = ds_list_find_value(_players, _g);
					var _pn = ds_map_find_value(_player, "player_number");
					if (_pn == _ext_player.player_number) {
						ds_list_delete(_players, _g);
						_number_of_players = ds_list_size(_players);
					}		
				}
			}
		}
		var _number_of_players_remain = ds_list_size(_players);
		for (var _i = 0; _i < _number_of_players_remain; ++_i) {
			_player = ds_list_find_value(_players, _i);
			var _xx = ds_map_find_value(_player, "x");
			var _yy = ds_map_find_value(_player, "y");
			var _new_player = instance_create_layer(_xx, _yy, "Instances", obj_player);
			_new_player.is_this_our_player = false;
			_new_player.player_number = ds_map_find_value(_player, "player_number");
		}
	}
}