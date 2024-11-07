if (device_mouse_x_to_gui(0) >= 52 && device_mouse_x_to_gui(0) < 883) {
	if (device_mouse_y_to_gui(0) >= 48 && device_mouse_y_to_gui(0) < 669) {
		if (player_id_round == global.player_number) {
			var _xx = floor((device_mouse_x_to_gui(0)-52) / 277);
			var _yy = floor((device_mouse_y_to_gui(0)-48) / 207);
			if (array_get(info, _xx * 3 + _yy) == -1) {
				
				array_set(info, _xx * 3 + _yy, global.player_number);

				var _data = ds_map_create();
				
				var _winner = -1;
				if (array_length(global.players_in_minigame) > 1) {
					var _player_2 = 0;
					var _player_1 = 0;
					for (var _j = 0; _j < 3; _j++) {
						for (var _i = 0; _i < 3; _i++) {
							if (array_get(info, _j * 3 + _i) == global.players_in_minigame[0]) {
								_player_1++;
							} else {
								if (array_get(info, _j * 3 + _i) == global.players_in_minigame[1]) {
									_player_2++;
								}
							}
						}
						if (_player_1 == 3) {
							_winner = global.players_in_minigame[0];
						} else {
							if (_player_2 == 3) {
								_winner = global.players_in_minigame[1];
							}
						}
						_player_1 = 0;
						_player_2 = 0;
					}
					_player_1 = 0;
					_player_2 = 0;
					if (_winner == -1) {
						for (var _j = 0; _j < 3; _j++) {
							for (var _i = 0; _i < 3; _i++) {
								if (array_get(info, _j + _i * 3) == global.players_in_minigame[0]) {
									_player_1++;
								} else {
									if (array_get(info, _j + _i * 3) == global.players_in_minigame[1]) {
										_player_2++;
									}
								}
							}
							if (_player_1 == 3) {
								_winner = global.players_in_minigame[0];
							} else {
								if (_player_2 == 3) {
									_winner = global.players_in_minigame[1];
								}
							}
							_player_1 = 0;
							_player_2 = 0;
						}
						_player_1 = 0;
						_player_2 = 0;
						if (_winner == -1) {
							if (array_get(info, 2) == global.players_in_minigame[0]) {
								_player_1++;
								if (array_get(info, 4) == global.players_in_minigame[0]) {
									_player_1++;
									if (array_get(info, 6) == global.players_in_minigame[0]) {
										_player_1++;
									}
								}
								if (_player_1 == 3) {
									_winner = global.players_in_minigame[0];
								}
							} else {
								if (array_get(info, 2) == global.players_in_minigame[1]) {
									_player_2++;
									if (array_get(info, 4) == global.players_in_minigame[1]) {
										_player_2++;
										if (array_get(info, 6) == global.players_in_minigame[1]) {
											_player_2++;
										}
									}
								}
								if (_player_2 == 3) {
									_winner = global.players_in_minigame[1];
								}
							}
							_player_1 = 0;
							_player_2 = 0;
							if (_winner == -1) {
								if (array_get(info, 0) == global.players_in_minigame[0]) {
									_player_1++;
									if (array_get(info, 4) == global.players_in_minigame[0]) {
										_player_1++;
										if (array_get(info, 8) == global.players_in_minigame[0]) {
											_player_1++;
										}
									}
									if (_player_1 == 3) {
										_winner = global.players_in_minigame[0];
									}
								} else {
									if (array_get(info, 0) == global.players_in_minigame[1]) {
										_player_2++;
										if (array_get(info, 4) == global.players_in_minigame[1]) {
											_player_2++;
											if (array_get(info, 8) == global.players_in_minigame[1]) {
												_player_2++;
											}
										}
									}
									if (_player_2 == 3) {
										_winner = global.players_in_minigame[1];
									}
								}
							}
						}
					}
				}
				if (_winner != -1) {
					player_win = _winner;
				}
				if (_winner == -1) {
					if (is_array(info)) {
						var _found = false;
						for (var _k = 0; _k < array_length(info); _k++) {
							if (array_get(info, _k) == -1) {
								_found = true;
							}
						}
						if (_found == false) {
							_winner = noone;
						}
					}
				}
	
				ds_map_add(_data, "minigame_id", global.game);
				ds_map_add(_data, "players_in_minigame", global.players_in_minigame);
				ds_map_add(_data, "info", info);
				ds_map_add(_data, "time", round_time);
				ds_map_add(_data, "player_win", _winner);
	
				send_player_over_udp(8080, 1000, _data, MSG_TYPE.SET_MINIGAMES);
			}
		}
	}
}