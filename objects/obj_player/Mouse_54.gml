if (is_this_our_player) {
	if (!global.lock) {
		if (global.gui_depth == 0) {
			my_path = path_add();

			if (mp_grid_path(global.my_grid, my_path, x, y, device_mouse_x(0), device_mouse_y(0), true)) {
				path_start(my_path, spd, path_action_stop, true);
			}
		}
	}
}