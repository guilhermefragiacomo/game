switch (global.option_selected) {
	case 0:
		draw_sprite_ext(spr_color_button,img_index,x,y,1,1,0, global.hair_colors[color], img_index == 0 ? 1 : 0.35);
		break;
	case 1:
		draw_sprite_ext(spr_color_button,img_index,x,y,1,1,0, global.skin_colors[color], img_index == 0 ? 1 : 0.35);
		break;
	default:
		draw_sprite_ext(spr_color_button,img_index,x,y,1,1,0, global.eye_colors[color], img_index == 0 ? 1 : 0.35);
		break;
}