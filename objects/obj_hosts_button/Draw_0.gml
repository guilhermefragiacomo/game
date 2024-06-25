draw_self();

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_set_font(fnt_server);
draw_text(x + 64, y, "host " + string(local_host_number) + " with " + string(local_number_of_player) + " players.");