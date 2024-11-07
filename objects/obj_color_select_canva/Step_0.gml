var _hovering = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id);

if (_hovering) {
	if (global.gui_depth == 1) {
		if (mouse_check_button_pressed(mb_left)) {
			instance_create_depth(0,0, -300, obj_color_selection_canva)
			global.gui_depth = 2;
		} else {
			if (mouse_check_button_pressed(mb_right)) {
				instance_create_depth(0,0, -300, obj_color_selection_canva)
				global.gui_depth = 2;
			}
		}
	}
}