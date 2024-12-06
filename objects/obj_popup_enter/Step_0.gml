if (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right)) {
	if (device_mouse_x_to_gui(0) >= x && device_mouse_x_to_gui(0) <= x + sprite_width) {
		if (device_mouse_y_to_gui(0) >= y && device_mouse_y_to_gui(0) <= y + sprite_height) {
			response = true;
		}
	}
}