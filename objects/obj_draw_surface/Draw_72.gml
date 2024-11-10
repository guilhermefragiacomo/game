if (!surface_exists(surf)){
 surf = surface_create(x_size, y_size);
 buffer_set_surface(buffer, surf, 0);
}

if (mouse_check_button_released(mb_left)){
 buffer_get_surface(buffer, surf, 0);
 show_debug_message(buffer_base64_encode(buffer, 0, buffer_get_size(buffer)));
 show_debug_message(buffer_get_size(buffer));
}