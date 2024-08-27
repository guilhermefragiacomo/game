event_inherited();
if (orientation == 1) {
	if (global.hair_selected < array_length(global.hair_styles_front_walk)-1) {
		global.hair_selected++;
	} else {
		if (global.hair_selected == array_length(global.hair_styles_front_walk)-1) {
			global.hair_selected = 0;
		}
	}
} else {
	if (global.hair_selected > 0) {
		global.hair_selected--;
	} else {
		if (global.hair_selected == 0) {
			global.hair_selected = array_length(global.hair_styles_front_walk)-1;
		}
	}
}