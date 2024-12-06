draw_sprite_ext(spr_palette_multicolors,0,x,y,1,1,0, global.canva_color_created, 1);
if (hover) {
	if (global.gui_depth == 1) {
		draw_sprite(spr_palette_multicolors_outline,0,x,y);
	}
}