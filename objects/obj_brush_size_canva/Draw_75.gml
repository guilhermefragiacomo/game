draw_self();

var _brush_size = prop * brush_size;

if (mouse_check_button(mb_left) || mouse_check_button(mb_right)) {
	if (device_mouse_x_to_gui(0) >= 40 && device_mouse_x_to_gui(0) <= 395) {
		if (device_mouse_y_to_gui(0) >= 68 && device_mouse_y_to_gui(0) <= 131) {
			_brush_size = device_mouse_x_to_gui(0);
			brush_size = (_brush_size-40) / prop;
			_brush_size -= 40;
		}
	}
}
draw_sprite_ext(spr_color_selection_arrow_canva,0,_brush_size+40-16,68, 1, 1, 0, c_white, 1);

draw_text(412,64,string(brush_size));
