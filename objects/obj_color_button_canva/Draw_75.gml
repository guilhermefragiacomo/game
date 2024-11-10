draw_sprite_ext(spr_color_button,0,x,y,1,1,0, color, is_visible && !empty ? 1 : 0);
if (hover) {
	if (global.gui_depth == 1) {
		draw_sprite(spr_color_button_outline,0,x,y);
	}
}