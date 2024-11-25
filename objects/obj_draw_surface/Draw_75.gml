mouse_x_previous = device_mouse_x_to_gui(0);
mouse_y_previous = device_mouse_y_to_gui(0);

if (global.canva_holding_color) {
	draw_sprite_ext(spr_canva_drop, 0, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 1, 1, 0, global.canva_color_selected, 1);
	draw_sprite(spr_canva_drop_outline, 0, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
}