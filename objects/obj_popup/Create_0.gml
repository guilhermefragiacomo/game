global.gui_depth++;
sprite_index = sprite;
popup_response = 0;

fade = instance_create_depth(1, 1, -400, obj_fade_gui);

switch (position) {
	case 0:
		close = instance_create_depth(sprite_width-sprite_get_width(spr_popup_close),8,-300, obj_popup_close);
		enter = instance_create_depth(sprite_width-sprite_get_width(spr_popup_enter),sprite_height-sprite_get_height(spr_popup_enter),-300, obj_popup_enter);
		break;
	case 1:
		close = instance_create_depth(window_get_width()/2-sprite_width-sprite_get_width(spr_popup_close),8,-300, obj_popup_close);
		enter = instance_create_depth(window_get_width()/2-sprite_width-sprite_get_width(spr_popup_enter),sprite_height-sprite_get_height(spr_popup_enter),-300, obj_popup_enter);
		break;
	case 2:
		close = instance_create_depth(window_get_width()-sprite_width-sprite_get_width(spr_popup_close),8,-300, obj_popup_close);
		enter = instance_create_depth(window_get_width()-sprite_width-sprite_get_width(spr_popup_enter),sprite_height-sprite_get_height(spr_popup_enter),-300, obj_popup_enter);
		break;
	case 3:
		close = instance_create_depth(sprite_width-sprite_get_width(spr_popup_close),window_get_height()/2+sprite_height,-300, obj_popup_close);
		enter = instance_create_depth(sprite_width-sprite_get_width(spr_popup_enter),window_get_height()/2-sprite_height-sprite_get_height(spr_popup_enter),-300, obj_popup_enter);
		break;
	case 4:
		close = instance_create_depth(sprite_width-sprite_get_width(spr_popup_close),window_get_height()-sprite_height,-300, obj_popup_close);
		enter = instance_create_depth(sprite_width-sprite_get_width(spr_popup_enter),window_get_height()-sprite_height-sprite_get_height(spr_popup_enter),-300, obj_popup_enter);
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
		close = instance_create_depth(window_get_width()/2+sprite_width/2-sprite_get_width(spr_popup_close),window_get_height()/2-sprite_height/2,-400, obj_popup_close);
		enter = instance_create_depth(window_get_width()/2+sprite_width/2-sprite_get_width(spr_popup_enter),window_get_height()/2+sprite_height/2-sprite_get_height(spr_popup_enter),-400, obj_popup_enter);
		
		break;
}

//close = instance_create_depth(0,0,-300, obj_popup_close);
//enter = instance_create_depth(0,0,-300, obj_popup_enter);
