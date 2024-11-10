hover = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id);

if (hover) {
	if (global.gui_depth == 1) {
		if (mouse_check_button_released(mb_left) || mouse_check_button_released(mb_right)) {
			if (!empty) {
				color = merge_color(color, global.canva_color_selected, 0.5);
				global.canva_color_selected = color;
			} else {
				if (global.canva_holding_color == true) {
					color = global.canva_color_selected;
					empty = false;
				}
			}
		}
		if (mouse_check_button_pressed(mb_left)) {
			if (empty == false) {
				empty = true;
				global.canva_holding_color = true;
				global.canva_color_selected = color;
				created = true;
			}
		} else {
			if (mouse_check_button_pressed(mb_right)) {
				if (empty == false) {
					empty = true;
					global.canva_holding_color = true;
					global.canva_color_selected = color;
					created = true;
				}
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

if (mouse_check_button_released(mb_left) || mouse_check_button_released(mb_right)) {
	created = false;
}