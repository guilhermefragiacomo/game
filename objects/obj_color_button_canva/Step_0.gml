var _hovering = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id);

if (_hovering) {
	if (global.gui_depth == 1) {
		if (mouse_check_button_pressed(mb_left)) {
			global.canva_color_selected = color;
		} else {
			if (mouse_check_button_pressed(mb_right)) {
				global.canva_color_selected = color;
			}
		}
	}
}

if (global.gui_depth > 1) {
	if (below = true) {
		is_visible = false;
	}
} else {
	is_visible = true;
}