alpha = clamp(alpha + .02, 0, 0.5);

if (global.minigame_running == false)
{
instance_destroy();
}

draw_set_color(c_black);
draw_set_alpha(alpha);
draw_rectangle(0, 0, room_width, room_height, 0);

draw_set_color(c_white);
draw_set_alpha(1);