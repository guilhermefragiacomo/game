draw_sprite(spr_tic_tac_toe_background, 0, 0, 0);

for (var _i = 0; _i < 3; _i++) {
	for (var _k = 0; _k < 3; _k++) {
		if (array_length(global.players_in_minigame) > 0) {
			if (array_get(info, _i * 3 + _k) == global.players_in_minigame[0]) {
				draw_sprite(spr_tic_tac_toe_x, 0, 52 + (_i * 277), 48 + (_k * 207));
			} else {
				if (array_length(global.players_in_minigame) > 1) {
					if (array_get(info, _i * 3 + _k) == global.players_in_minigame[1]) {
						draw_sprite(spr_tic_tac_toe_o, 0, 52 + (_i * 277), 48 + (_k * 207));
					}
				}
			}
		}
	}
}

draw_set_color(#A35909);
draw_set_font(fnt_gui);
draw_text_transformed(1085,172, "Vez de", 2.5, 2.5, 0);
var _number_of_player_in_level = instance_number(obj_player);
if (_number_of_player_in_level > 0) {
	for (var _j = 0; _j < _number_of_player_in_level; ++_j) {
		var _ext_player = instance_find(obj_player, _j);
		if (player_id_round == _ext_player.player_number) {
			draw_text_transformed(1085,320, string(_ext_player.player_name), 2.5, 2.5, 0);
		}	
	}
}
draw_text_transformed(1085,420, string(time), 2.5, 2.5, 0);
draw_set_color(c_white);