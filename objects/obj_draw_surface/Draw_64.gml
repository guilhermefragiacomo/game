draw_sprite(spr_canva_background, 0, 0, 0);
draw_sprite(spr_palette,0, 0, 0);

draw_sprite_ext(spr_palette_brush_head,0,0,0,1,1,0,global.canva_color_selected,1);

if (global.gui_depth == 1) {
	if (device_mouse_x_to_gui(0) >= 0 && device_mouse_x_to_gui(0) <= 79) {
		if (device_mouse_y_to_gui(0) >= 225 && device_mouse_y_to_gui(0) <= 546) {
			draw_sprite(spr_palette_brush_holder,1,0,0);
			if (mouse_check_button(mb_left) || mouse_check_button(mb_right)) {
				instance_create_depth(0,0,-300, obj_brush_size_canva);
				global.gui_depth = 2;
			}
		} else {
			draw_sprite(spr_palette_brush_holder,0,0,0);
		}
	} else {
		draw_sprite(spr_palette_brush_holder,0,0,0);
	}
} else {
	draw_sprite(spr_palette_brush_holder,0,0,0);
}

if (mouse_check_button(mb_left) || mouse_check_button(mb_right)){
	if (global.gui_depth == 1) {
		surface_set_target(surf);
 
		var _mouse_x_real = device_mouse_x_to_gui(0)-x_size;
		var _mouse_y_real = device_mouse_y_to_gui(0)-y_size/2;

		draw_set_color(global.canva_color_selected);
		draw_line_width(_mouse_x_real/3, _mouse_y_real/3, (mouse_x_previous-x_size)/3, (mouse_y_previous-y_size/2)/3, global.canva_brush_size);

		surface_reset_target();
	}
}

draw_surface_ext(surf, x_size, y_size/2, 3, 3, 0, c_white, 1);
draw_set_color(c_white);
