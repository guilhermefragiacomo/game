if (global.option_selected == 0) {
	draw_set_color(#A35909);
	draw_set_font(fnt_gui);
	draw_text_transformed(800, 440, string(global.hair_selected+1), 4, 4, 0);
}