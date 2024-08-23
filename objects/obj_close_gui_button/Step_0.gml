x = camera_get_view_x(view_camera[0])+display_get_gui_width()-144; 
y = camera_get_view_y(view_camera[0])+display_get_gui_height()-132;

if (global.show_gui == false) {
	instance_destroy(self);
}