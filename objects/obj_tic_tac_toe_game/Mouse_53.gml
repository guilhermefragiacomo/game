if (window_mouse_get_x() >= 52 && window_mouse_get_x() < 883) {
	if (window_mouse_get_y() >= 48 && window_mouse_get_y() < 669) {
		if (player_id_round == global.player_number) {
			var _xx = floor((window_mouse_get_x()-52) / 277);
			var _yy = floor((window_mouse_get_y()-48) / 207);
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
								if (array_get(info, 2) == global.players_in_minigame[0]) {
									_player_2++;
									if (array_get(info, 4) == global.players_in_minigame[0]) {
										_player_2++;
										if (array_get(info, 6) == global.players_in_minigame[0]) {
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
									if (array_get(info, 0) == global.players_in_minigame[0]) {
										_player_2++;
										if (array_get(info, 4) == global.players_in_minigame[0]) {
											_player_2++;
											if (array_get(info, 8) == global.players_in_minigame[0]) {
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