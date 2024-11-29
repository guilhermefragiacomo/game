switch (position) {
	case 0:
		draw_sprite(sprite,0,0,0);
		break;
	case 1:
		draw_sprite(sprite,0,window_get_width()/2-sprite_width,0);
		break;
	case 2:
		draw_sprite(sprite,0,window_get_width()-sprite_width,0);
		break;
	case 3:
		draw_sprite(sprite,0,0,window_get_height()/2-sprite_height);
		break;
	case 4:
		draw_sprite(sprite,0,0,window_get_height()-sprite_height);
		break;
	case 5:
		draw_sprite(sprite,0,window_get_width()/2-sprite_width,window_get_height()-sprite_height);
		break;
	case 6:
		draw_sprite(sprite,0,window_get_width()-sprite_width,window_get_height()-sprite_height);
		break;
	case 7:
		draw_sprite(sprite,0,window_get_width()-sprite_width,window_get_height()/2-sprite_height);
		break;
	default:
		draw_sprite(sprite,0,window_get_width()/2-sprite_width,window_get_height()/2-sprite_height);
		break;
}
