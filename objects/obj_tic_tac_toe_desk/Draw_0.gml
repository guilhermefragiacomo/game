if (show_text) {
	draw_text(x + 32,y-92, "Jogo da Velha");
	draw_sprite_ext(spr_tic_tac_toe_table, 0, x - (sprite_get_width(spr_tic_tac_toe_table)*0.125),y + (sprite_get_height(spr_tic_tac_toe_table)*0.125), 1.25, 1.25, 0, c_white, 1);
} else {
	draw_sprite(spr_tic_tac_toe_table, 0, x,y);
}