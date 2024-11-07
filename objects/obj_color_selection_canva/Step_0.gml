if (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right)) {
	if (device_mouse_x_to_gui(0) >= 456 && device_mouse_x_to_gui(0) <= 507) {
		if (device_mouse_y_to_gui(0) >= 264 && device_mouse_y_to_gui(0) <= 315) {
			global.gui_depth = 1;
			global.canva_color_selected = global.canva_color_created;
			instance_destroy();
		}
	}
	if (device_mouse_x_to_gui(0) >= 456 && device_mouse_x_to_gui(0) <= 507) {
		if (device_mouse_y_to_gui(0) >= 8 && device_mouse_y_to_gui(0) <= 59) {
			global.gui_depth = 1;
			global.canva_color_created = color_before;
			instance_destroy();
		}
	}
}