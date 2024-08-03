var _y = 0, _x = 0;
switch (global.option_selected) {
	case 0:
		if (!hair_created) {
			hair_created = true;
			skin_created = false;
			eye_created = false;
			
			layer_destroy_instances("ColorInstances");
			layer_destroy_instances("Arrows");
			
			instance_create_layer(840, 440, "Arrows", obj_arrow_hair_button,
				{
				    orientation : 1
				})
			instance_create_layer(768, 440, "Arrows", obj_arrow_hair_button,
				{
				    orientation : -1
				})
			
			for (var _i = 0; _i < array_length(global.hair_colors); _i++) {
				if (_i % 5 == 0) {
					if (_i != 0) {
						_y += 76;
						_x = 0;
					}
				} else {
					_x++;
				}
				instance_create_layer(612 + _x * 76, 164 + _y, "ColorInstances", obj_color_button,
				{
				    color : _i
				});
			}
		}		
		break;
	case 1:
		if (!skin_created) {
			hair_created = false;
			skin_created = true;
			eye_created = false;
			
			layer_destroy_instances("ColorInstances");
			layer_destroy_instances("Arrows");
			
			for (var _i = 0; _i < array_length(global.skin_colors); _i++) {
				if (_i % 5 == 0) {
					if (_i != 0) {
						_y += 76;
						_x = 0;
					}
				} else {
					_x++;
				}
				instance_create_layer(612 + _x * 76, 164 + _y, "ColorInstances", obj_color_button,
				{
				    color : _i
				});
			}
		}
		break;
	default:
		if (!eye_created) {
			hair_created = false;
			skin_created = false;
			eye_created = true;
			
			layer_destroy_instances("ColorInstances");
			layer_destroy_instances("Arrows");
			
			for (var _i = 0; _i < array_length(global.eye_colors); _i++) {
				if (_i % 5 == 0) {
					if (_i != 0) {
						_y += 76;
						_x = 0;
					}
				} else {
					_x++;
				}
				instance_create_layer(612 + _x * 76, 164 + _y, "ColorInstances", obj_color_button,
				{
				    color : _i
				});
			}
		}
		break;
}