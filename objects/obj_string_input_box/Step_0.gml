if (focus) {
	if (!alarm_started) {
		alarm_started = true;
		alarm[0] = 1;
	}
	
	keyboard_string = string_copy(keyboard_string, 1, string_max);
	output = keyboard_string;
}

if (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right)) {
	if (device_mouse_x_to_gui(0) >= x && device_mouse_x_to_gui(0) <= x + sprite_get_width(spr_player_name_box)) {
		if (device_mouse_y_to_gui(0) >= y && device_mouse_y_to_gui(0) <= y + sprite_get_height(spr_player_name_box)) {
			focus = true;
		} else {
			focus = false;
		}
	} else {
		focus = false;
	}
}