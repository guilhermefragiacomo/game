draw_set_alpha(1);

draw_sprite(spr_waiting_for_players,0,0,0);

draw_set_color(#A35909);
draw_set_font(fnt_gui);
draw_text_transformed(1085,145, "Esperando", 2.5, 2.5, 0);
draw_text_transformed(1085,185, "outros jogadores", 2.5, 2.5, 0);
draw_set_color(c_white);

image_speed = 0.2;
var _y = 0;

for (var _i = 0; _i < array_length(global.players_in_minigame); _i++) {
	draw_sprite(spr_player_name_box, 0, 932, 252 + _i * 60);
	draw_set_color(#A35909);
	draw_set_font(fnt_gui);
	var _number_of_player_in_level = instance_number(obj_player);
	if (_number_of_player_in_level > 0) {
		for (var _j = 0; _j < _number_of_player_in_level; ++_j) {
			var _ext_player = instance_find(obj_player, _j);
			if (array_get(global.players_in_minigame, _i) == _ext_player.player_number) {
				draw_text_transformed(1052, 276 + _i * 60, string(_ext_player.player_name), 2.5, 2.5, 0);
			}	
		}
	}
	draw_set_color(c_white);
	_y = _i+1;
}
for (var _j = 0; _j < global.player_limit - array_length(global.players_in_minigame); _j++) {
	draw_sprite(spr_player_name_box_loading, -1, 932, 252 + (_y + _j) * 60);
}

if (global.counter > 0) {
	draw_set_color(#A35909);
	draw_set_font(fnt_gui);
	draw_text_transformed(1052, 500, string(global.counter), 2.5, 2.5, 0);
	if (tempo) {
		tempo = false;
		alarm[0] = game_get_speed(gamespeed_fps);
	}
}

draw_set_color(c_white);

draw_set_font(fnt_server);
