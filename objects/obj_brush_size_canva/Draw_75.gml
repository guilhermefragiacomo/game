draw_self();
var _close_alpha = 1;
var _enter_alpha = 1;
if (device_mouse_x_to_gui(0) >= 456 && device_mouse_x_to_gui(0) <= 507) {
	if (device_mouse_y_to_gui(0) >= 8 && device_mouse_y_to_gui(0) <= 59) {
		_close_alpha = 0.5;
	}
}
if (device_mouse_x_to_gui(0) >= 456 && device_mouse_x_to_gui(0) <= 507) {
	if (device_mouse_y_to_gui(0) >= 132 && device_mouse_y_to_gui(0) <= 183) {
		_enter_alpha = 0.5;
	}
}
draw_sprite_ext(spr_popup_close,1,0,0,1,1,0,c_white,_close_alpha);
draw_sprite_ext(spr_popup_enter,1,0,-132,1,1,0,c_white,_enter_alpha);

var _brush_size = prop * brush_size;

if (mouse_check_button(mb_left) || mouse_check_button(mb_right)) {
	if (device_mouse_x_to_gui(0) >= 40 && device_mouse_x_to_gui(0) <= 395) {
		if (device_mouse_y_to_gui(0) >= 68 && device_mouse_y_to_gui(0) <= 131) {
			_brush_size = device_mouse_x_to_gui(0);
			brush_size = (_brush_size-40) / prop;
			_brush_size -= 40;
		}
	}
}
draw_sprite_ext(spr_color_selection_arrow_canva,0,_brush_size+40-16,68, 1, 1, 0, c_white, 1);

draw_text(412,64,string(brush_size));
