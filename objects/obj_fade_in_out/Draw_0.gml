alpha = clamp(alpha + (fade * .02), 0, 1);

if (alpha == 1)
{
fade = -1;
}

if (alpha == 0) && (fade == -1)
{
instance_destroy();
}

draw_set_color(c_black);
draw_set_alpha(alpha);
draw_rectangle(0, 0, room_width, room_height, 0);

//Reset opacity
draw_set_alpha(1);
draw_set_color(c_white);