hover = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id);

if (hover) {
	if (global.gui_depth == 1) {
		if (!created) {
			if (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right)) {
				created = true;
				global.canva_color_selected = global.canva_color_created
				global.canva_holding_color = true;
			}
		}
		if (mouse_check_button_released(mb_left)) {
			if (created) {
				instance_create_layer(0,0, layer_get_id("Layer2"), obj_color_selection_canva)
				created = false;
				global.gui_depth = 2;
			}
		} else {
			if (mouse_check_button_released(mb_right)) {
				if (created) {
					instance_create_layer(0,0, layer_get_id("Layer2"), obj_color_selection_canva)
					created = false;
					global.gui_depth = 2;
				}
			}
		}
	}
}

if (mouse_check_button_released(mb_left) || mouse_check_button_released(mb_right)) {
	created = false;
	global.canva_holding_color = false;
}