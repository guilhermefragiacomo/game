draw_sprite(spr_tic_tac_toe_background, 0, 0, 0);

draw_set_color(#A35909);
draw_set_font(fnt_gui);
draw_text_transformed(1085,172, "Vez de", 2.5, 2.5, 0);
draw_text_transformed(1085,320, string(player_id_round), 2.5, 2.5, 0);
draw_text_transformed(1085,420, string(time), 2.5, 2.5, 0);
draw_set_color(c_white);