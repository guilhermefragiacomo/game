if (!surface_exists(surf)){
 surf = surface_create(320, 180);
 buffer_set_surface(buffer, surf, 0);
}

if (mouse_check_button_released(mb_left)){
 buffer_get_surface(buffer, surf, 0);
}