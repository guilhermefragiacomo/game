draw_set_color(c_white);
draw_sprite(spr_player_name_box,0,x,y);
draw_set_font(global.font);
draw_set_halign(fa_left);
draw_text_transformed(x,y, output, font_size, font_size,0);

draw_set_halign(fa_center);
if (alarm[0]) {
	if (string_length(output)<string_max) {
		draw_line_width(x+(string_width(output) * font_size) + 12, y+10,x+(string_width(output) * font_size) + 12, y+40, 3);
	}
}

draw_set_font(fnt_server);
draw_set_halign(fa_center); 