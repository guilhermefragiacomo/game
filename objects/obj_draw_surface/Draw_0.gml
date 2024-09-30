if (mouse_check_button(mb_left)){
 surface_set_target(surf);

 draw_line_width(mouse_x, mouse_y, mouse_x_previous, mouse_y_previous, brush_size);

 surface_reset_target();
}

draw_surface(surf, 0, 0);

