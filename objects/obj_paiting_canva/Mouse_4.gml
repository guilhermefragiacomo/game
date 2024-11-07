if (global.gui_depth == 0) {
	instance_create_depth(0,0,-300,obj_draw_surface);
	global.lock = true;
}