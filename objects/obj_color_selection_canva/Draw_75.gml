draw_self();
var _close_alpha = 1;
var _enter_alpha = 1;
if (device_mouse_x_to_gui(0) >= 456 && device_mouse_x_to_gui(0) <= 507) {
	if (device_mouse_y_to_gui(0) >= 8 && device_mouse_y_to_gui(0) <= 59) {
		_close_alpha = 0.5;
	}
}
if (device_mouse_x_to_gui(0) >= 456 && device_mouse_x_to_gui(0) <= 507) {
	if (device_mouse_y_to_gui(0) >= 264 && device_mouse_y_to_gui(0) <= 315) {
		_enter_alpha = 0.5;
	}
}
draw_sprite_ext(spr_color_selection_close_canva,1,0,0,1,1,0,c_white,_close_alpha);
draw_sprite_ext(spr_color_selection_enter_canva,1,0,0,1,1,0,c_white,_enter_alpha);

draw_sprite_ext(spr_color_selection_sat_canva,0,0,0,1,1,0,make_color_hsv(hue,sat,val),1);
global.canva_color_created = make_color_hsv(hue,sat,val);

var _hue = prop * hue;
var _sat = prop2 * sat;
var _val = prop2 * val;
if (mouse_check_button(mb_left) || mouse_check_button(mb_right)) {
	if (device_mouse_x_to_gui(0) >= 40 && device_mouse_x_to_gui(0) <= 395) {
		if (device_mouse_y_to_gui(0) >= 68 && device_mouse_y_to_gui(0) <= 131) {
			_hue = device_mouse_x_to_gui(0);
			hue = (_hue-40) / prop;
			_hue -= 40;
		}
		if (device_mouse_y_to_gui(0) >= 140 && device_mouse_y_to_gui(0) <= 203) {
			_sat = device_mouse_x_to_gui(0);
			sat = (_sat-40) / prop2;
			_sat -= 40;
		}
		if (device_mouse_y_to_gui(0) >= 212 && device_mouse_y_to_gui(0) <= 275) {
			_val = device_mouse_x_to_gui(0);
			val = (_val-40) / prop2;
			_val -= 40;
		}
	}
}
draw_sprite(spr_color_selection_arrow_canva,0,_hue+40-16,68);
draw_sprite(spr_color_selection_arrow_canva,0,_sat+40-16,140);
draw_sprite(spr_color_selection_arrow_canva,0,_val+40-16,212);

draw_text(412,64,string(hue));
draw_text(412,140,string(sat));
draw_text(412,212,string(val));