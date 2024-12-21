if (input2 == "") {
	sprite = spr_popup_small;
} else {
	sprite = spr_popup_medium;
}

event_inherited();
/*
switch (position) {
	case 0:
		input1_obj = instance_create_depth(128,128,-300, obj_string_input_box);
		if (input2 != "") {
			input2_obj = instance_create_depth(128,192,-300, obj_string_input_box);
		}
		break;
	case 1:
		close = instance_create_depth(window_get_width()/2-sprite_width-sprite_get_width(spr_popup_close),8,-300, obj_popup_close);
		if (ok) {
			enter = instance_create_depth(window_get_width()/2-sprite_width-sprite_get_width(spr_popup_enter),sprite_height-sprite_get_height(spr_popup_enter),-300, obj_popup_enter);
		}
		break;
	case 2:
		close = instance_create_depth(window_get_width()-sprite_width-sprite_get_width(spr_popup_close),8,-300, obj_popup_close);
		if (ok) {
			enter = instance_create_depth(window_get_width()-sprite_width-sprite_get_width(spr_popup_enter),sprite_height-sprite_get_height(spr_popup_enter),-300, obj_popup_enter);
		}
		break;
	case 3:
		close = instance_create_depth(sprite_width-sprite_get_width(spr_popup_close),window_get_height()/2+sprite_height,-300, obj_popup_close);
		if (ok) {
			enter = instance_create_depth(sprite_width-sprite_get_width(spr_popup_enter),window_get_height()/2-sprite_height-sprite_get_height(spr_popup_enter),-300, obj_popup_enter);
		}
		break;
	case 4:
		close = instance_create_depth(sprite_width-sprite_get_width(spr_popup_close),window_get_height()-sprite_height,-300, obj_popup_close);
		if (ok) {
			enter = instance_create_depth(sprite_width-sprite_get_width(spr_popup_enter),window_get_height()-sprite_height-sprite_get_height(spr_popup_enter),-300, obj_popup_enter);
		}
		break;
	case 5:
		//draw_sprite(sprite,0,window_get_width()/2-sprite_width/2,window_get_height()-sprite_height/2);
		break;
	case 6:
		//draw_sprite(sprite,0,window_get_width()-sprite_width/2,window_get_height()-sprite_height/2);
		break;
	case 7:
		//draw_sprite(sprite,0,window_get_width()-sprite_width/2,window_get_height()/2-sprite_height/2);
		break;
	default:
		input1_obj = instance_create_depth(window_get_width()/2+64,window_get_height()/2+64,-300, obj_string_input_box);
		if (input2 != "") {
			input2_obj = instance_create_depth(128,192,-300, obj_string_input_box);
		}
		break;
}
*/
 var _popup_width = sprite_get_width(sprite); 
 var _popup_height = sprite_get_height(sprite); 
 var _screen_width = 1280; 
 var _screen_height = 720; 
 
 // Calculate default center position 
 var _default_x = (_screen_width - _popup_width) / 2; 
 var _default_y = (_screen_height - _popup_height) / 2; 
 
 // Variables to store the final position 
 var _popup_x, _popup_y; 
 
 // Switch case for different positions 
 
 switch (position) { 
	 case 0: // Left upper corner 
		 _popup_x = 0; 
		 _popup_y = 0; 
		 break; 
	 case 1: // Center top 
		 _popup_x = _default_x; 
		 _popup_y = 0; 
		 break; 
	 case 2: // Right upper corner 
		 _popup_x = _screen_width - _popup_width; 
		 _popup_y = 0; 
		break; 
	 case 3: // Left center
		_popup_x = 0; _popup_y = _default_y; 
		 break; 
	 case 4: // Right center 
		 _popup_x = _screen_width - _popup_width; 
		 _popup_y = _default_y; 
		 break; 
	 case 5: // Left lower corner 
		_popup_x = 0; _popup_y = _screen_height - _popup_height; 
		break; 
	 case 6: // Lower center 
		_popup_x = _default_x; _popup_y = _screen_height - _popup_height; 
		break; 
	 case 7: // Right lower corner 
		_popup_x = _screen_width - _popup_width; _popup_y = _screen_height - _popup_height; 
		break; 
	 default: // Middle of the screen 
		_popup_x = _default_x; _popup_y = _default_y; 
} 
	 
// Draw the input box 
input1_obj = instance_create_depth(_popup_x + 20, _popup_y + 80,-300, obj_string_input_box);
//draw_text_transformed(_popup_x + 20, _popup_y + 80, input_string, 0.6, 0.6, 0);