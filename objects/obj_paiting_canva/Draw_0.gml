if (show_text && global.gui_depth == 0) {
	draw_sprite_ext(spr_canva, 0, x - (sprite_get_width(spr_canva)*0.125),y + (sprite_get_height(spr_canva)*0.125), 1.25, 1.25, 0, c_white, 1);
	draw_text(x + 32,y-124, "Pintura");
} else {
	draw_sprite(spr_canva, 0, x,y);
}