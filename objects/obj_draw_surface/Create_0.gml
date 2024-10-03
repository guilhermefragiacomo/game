x_size = 320;
y_size = 180;

surf = surface_create(x_size, y_size);

brush_size = 3;

buffer = buffer_create(4 * x_size * y_size, buffer_grow, 1);


window_x_diff = window_get_width()/1280;
window_y_diff = window_get_height()/720;
var _count = 0;
while (window_x_diff/window_y_diff > 16/9) {
	_count++;
	window_x_diff = (window_get_width()-_count)/1280;
}
_count = 0;
while (window_x_diff/window_y_diff < 16/9) {
	_count++;
	window_y_diff = (window_get_height()-_count)/720;
}


mouse_x_previous = (window_mouse_get_x()/window_x_diff)/3;
mouse_y_previous = (window_mouse_get_y()/window_y_diff)/3;