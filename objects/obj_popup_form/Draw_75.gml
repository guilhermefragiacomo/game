event_inherited();

draw_set_font(global.font);
draw_set_color(c_white);
/*
switch (position) {
	case 0:
		draw_text_transformed(sprite_get_width(sprite)/2,16,title,0.6,0.6,0);
		draw_text_transformed(16, 64, input1, 0.6,0.6,0);
		break;
	default:
		draw_text_transformed(window_get_width()/2,window_get_height()/2+16,title,0.6,0.6,0);
		draw_text_transformed(window_get_width()/2+16, window_get_height()/2+64, input1, 0.6,0.6,0);
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

draw_set_halign(fa_left)
// Draw the popup 
//draw_sprite(spr_popup, 0, _popup_x, _popup_y); 
// Draw the title 
draw_text_transformed(_popup_x + (_popup_width / 2), _popup_y + 30, title, 0.6,0.6,0); 
// Draw the label 
draw_text_transformed(_popup_x + 40, _popup_y + 50, input1, 0.6,0.6,0);
// Draw the input box 
// draw_text_transformed(_popup_x + 20, _popup_y + 80, input_string, 0.6, 0.6, 0);
draw_set_halign(fa_center)
draw_set_font(fnt_server);
