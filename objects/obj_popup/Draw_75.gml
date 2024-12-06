switch (position) {
	case 0:
		draw_sprite(sprite,0,0,0);
		
		break;
	case 1:
		draw_sprite(sprite,0,window_get_width()/2-sprite_width/2,0);
		break;
	case 2:
		draw_sprite(sprite,0,window_get_width()-sprite_width/2,0);
		break;
	case 3:
		draw_sprite(sprite,0,0,window_get_height()/2-sprite_height/2);
		break;
	case 4:
		draw_sprite(sprite,0,0,window_get_height()-sprite_height/2);
		break;
	case 5:
		draw_sprite(sprite,0,window_get_width()/2-sprite_width/2,window_get_height()-sprite_height/2);
		break;
	case 6:
		draw_sprite(sprite,0,window_get_width()-sprite_width/2,window_get_height()-sprite_height/2);
		break;
	case 7:
		draw_sprite(sprite,0,window_get_width()-sprite_width/2,window_get_height()/2-sprite_height/2);
		break;
	default:
		draw_sprite(sprite,0,window_get_width()/2-sprite_width/2,window_get_height()/2-sprite_height/2);
		break;
}
