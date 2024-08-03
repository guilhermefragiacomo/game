switch (global.option_selected) {
	case 0:
		if (global.hair_color_selected == color) {
			if (img_index == 0) {
				img_index = 1;
				show_debug_message("cor selecionada " + string(color));
			}
		} else {
			if (img_index == 1) {
				img_index = 0;
			}
		}
		break;
	case 1:
		if (global.skin_color_selected == color) {
			if (img_index == 0) {
				img_index = 1;
				show_debug_message("cor selecionada " + string(color));
			}
		} else {
			if (img_index == 1) {
				img_index = 0;
			}
		}
		break;
	default:
		if (global.eye_color_selected == color) {
			if (img_index == 0) {
				img_index = 1;
				show_debug_message("cor selecionada " + string(color));
			}
		} else {
			if (img_index == 1) {
				img_index = 0;
			}
		}
		break;
}