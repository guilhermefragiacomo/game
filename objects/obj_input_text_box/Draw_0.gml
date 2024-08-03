draw_set_color(#A35909);
draw_set_font(fnt_gui);
draw_set_halign(fa_left);
draw_text_transformed(x,y, keyboard_string, 4,4,0);
//draw_text_transformed_color()
//draw_text_ext_transformed_color(x, y, keyboard_string, 1, 180, 4, 4, 0, c_black, c_black, c_black, c_black, 1);

draw_set_halign(fa_center);
if (alarm[0]) {
	if (string_length(keyboard_string)<string_max) {
		draw_line_width(x+(string_width(keyboard_string) * 4) + 12, y+10,x+(string_width(keyboard_string) * 4) + 12, y+40, 3);
	}
}