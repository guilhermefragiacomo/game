if (!surface_exists(surf)){
 surf = surface_create(x_size, y_size);
 buffer_set_surface(buffer, surf, 0);
}

if (mouse_check_button_released(mb_left)){
 buffer_get_surface(buffer, surf, 0);
}