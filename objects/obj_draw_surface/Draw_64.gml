if (mouse_check_button(mb_left)){
 surface_set_target(surf);
 
 var _mouse_x_real = (window_mouse_get_x()/window_x_diff)/3-x_size/3;
 var _mouse_y_real = (window_mouse_get_y()/window_y_diff)/3-y_size/6;

 draw_sprite_ext(spr_canva, 0, 0, 0, 2, 2, 0, c_white, 1);
 
 draw_line_width(_mouse_x_real, _mouse_y_real, mouse_x_previous-x_size/3, mouse_y_previous-y_size/6, brush_size);

 surface_reset_target();
}

draw_surface_ext(surf, x_size, y_size/2, 3, 3, 0, c_white, 1);

