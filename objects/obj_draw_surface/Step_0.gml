if (global.gui_depth == 1) {
	if (device_mouse_x_to_gui(0) >= 612 && device_mouse_x_to_gui(0) < 991) {
		if (device_mouse_y_to_gui(0) >= 644 && device_mouse_y_to_gui(0) <= 715) {
			if (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right)) {
				finish = instance_create_depth(0,0,-300,obj_popup,{
					sprite: spr_popup_finish_painting
				});
			}
		}
	}
}

if (finish.popup_response == 1) {
	instance_destroy(finish);
	finish = id;
	save = instance_create_depth(0,0,-300,obj_popup,{
		sprite: spr_save_painting_button
	});
} else {
	if (finish.popup_response == -1) {
		instance_destroy(finish);
		finish = id;
	}
}
if (save.popup_response == 1) {
	instance_destroy(save);
	save = id;
	var _painting = buffer_base64_encode(buffer, 0, buffer_get_size(buffer));
	
	send_packet = true;
	alarm[0] = game_get_speed(gamespeed_fps)/3;
	
} else {
	if (save.popup_response == -1) {
		instance_destroy(save);
		instance_destroy(fade);
		instance_destroy(palette);
		instance_destroy(button1);
		instance_destroy(button2);
		instance_destroy(button3);
		instance_destroy(button4);
		instance_destroy(select_button);
		instance_destroy();
		global.gui_depth = 0;
		global.minigame_running = false;
		global.lock = false;
	}
}