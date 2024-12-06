if (close.response == true) {
	instance_destroy(close);
	instance_destroy(enter);
	instance_destroy(fade);
	popup_response = -1;
	global.gui_depth--;
} else {
	if (enter.response == true) {
		instance_destroy(close);
		instance_destroy(enter);
		instance_destroy(fade);
		popup_response = 1;
		global.gui_depth--;
	}
}