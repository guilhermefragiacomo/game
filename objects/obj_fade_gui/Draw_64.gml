alpha = clamp(alpha + .02, 0, 0.5);

draw_set_color(c_black);
draw_set_alpha(alpha);
draw_rectangle(0, 0, window_get_width(), window_get_height(), 0);

draw_set_color(c_white);
draw_set_alpha(1);