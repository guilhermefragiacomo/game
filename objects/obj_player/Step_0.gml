if (is_this_our_player) {
	input_check();
	connected = true;
	set_player_states();
	player_number = global.player_number;
} else {
	get_player_states();
}

if (is_this_our_player) {
	if (!global.lock) {
		if (global.gui_depth == 0) {
			movement_animation();
		}
	}
} else {
	movement_animation();
}

if (keyboard_check_pressed(ord("F"))) {
	input_form = instance_create_depth(x,y,-200,obj_popup_form,{
		title: "Login",
		input1: "Senha"
	});
}

if (input_form.popup_response == 1 || input_form.popup_response == -1) {
	instance_destroy(input_form.input1_obj);
	instance_destroy(input_form);
	input_form = id;
}