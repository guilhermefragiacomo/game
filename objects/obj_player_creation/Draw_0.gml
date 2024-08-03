switch (global.player_state) {
	case PLAYER_STATES.STAND_FRONT:
		//draw_sprite_ext(spr_player_front_shade,0,x,y,4,4,0,c_white,1);
		//draw_sprite_ext(spr_player_front_hair_styles_shade,hair_style_selected,x,y,4,4,0,c_white,1);
		draw_sprite_ext(spr_player_front_boots,0,x,y,4,4,0,c_white,1);
		draw_sprite_ext(spr_player_front_default,0,x,y,4,4,0,c_white,1);
		draw_sprite_ext(spr_player_front_eye_colorless,0,x,y,4,4,0,global.eye_colors[global.eye_color_selected],1);
		draw_sprite_ext(spr_player_front_leggings,0,x,y,4,4,0,c_white,1);
		draw_sprite_ext(spr_player_front_shirt,0,x,y,4,4,0,c_white,1);
		if (global.skin_color_selected != 6) {
			draw_sprite_ext(spr_player_front_skin_colorless,0,x,y,4,4,0,global.skin_colors[global.skin_color_selected],1);
		} else {
			draw_sprite_ext(spr_player_front_skin,0,x,y,4,4,0,c_white,1);
		}
		draw_sprite_ext(spr_player_front_hair_styles,global.hair_selected,x,y,4,4,0,global.hair_colors[global.hair_color_selected],1);
		global.player_xscale = 1;
		break;
	case PLAYER_STATES.STAND_BACK:
		draw_sprite_ext(spr_player_back_boots,0,x,y,4,4,0,c_white,1);
		draw_sprite_ext(spr_player_back_leggings,0,x,y,4,4,0,c_white,1);
		draw_sprite_ext(spr_player_back_shirt,0,x,y,4,4,0,c_white,1);
		if (global.skin_color_selected != 6) {
			draw_sprite_ext(spr_player_back_skin_colorless,0,x,y,4,4,0,global.skin_colors[global.skin_color_selected],1);
		} else {
			draw_sprite_ext(spr_player_back_skin,0,x,y,4,4,0,c_white,1);
		}
		draw_sprite_ext(spr_player_back_hair_styles,global.hair_selected,x,y,4,4,0,global.hair_colors[global.hair_color_selected],1);
		global.player_xscale = 1;
		break;
	case PLAYER_STATES.STAND_SIDE:
		draw_sprite_ext(spr_player_side_boots,0,x,y,global.player_xscale * 4,4,0,c_white,1);
		draw_sprite_ext(spr_player_side_default,0,x,y,global.player_xscale * 4,4,0,c_white,1);
		draw_sprite_ext(spr_player_side_eye_colorless,0,x,y,global.player_xscale * 4,4,0,global.eye_colors[global.eye_color_selected],1);
		draw_sprite_ext(spr_player_side_leggings,0,x,y,global.player_xscale * 4,4,0,c_white,1);
		draw_sprite_ext(spr_player_side_shirt,0,x,y,global.player_xscale * 4,4,0,c_white,1);
		if (global.skin_color_selected != 6) {
			draw_sprite_ext(spr_player_side_skin_colorless,0,x,y,global.player_xscale * 4,4,0,global.skin_colors[global.skin_color_selected],1);
		} else {
			draw_sprite_ext(spr_player_side_skin,0,x,y,global.player_xscale * 4,4,0,c_white,1);
		}
		draw_sprite_ext(spr_player_side_hair_styles,global.hair_selected,x,y,global.player_xscale * 4,4,0,global.hair_colors[global.hair_color_selected],1);
		break;
	case PLAYER_STATES.WALK_FRONT:
		draw_sprite_ext(spr_player_front_walking_boots,-1,x,y,4,4,0,c_white,1);
		draw_sprite_ext(spr_player_front_walking_default,-1,x,y,4,4,0,c_white,1);
		draw_sprite_ext(spr_player_front_walking_eye_colorless,-1,x,y,4,4,0,global.eye_colors[global.eye_color_selected],1);
		draw_sprite_ext(spr_player_front_walking_leggings,-1,x,y,4,4,0,c_white,1);
		draw_sprite_ext(spr_player_front_walking_shirt,-1,x,y,4,4,0,c_white,1);
		if (global.skin_color_selected != 6) {
			draw_sprite_ext(spr_player_front_walking_skin_colorless,0,x,y,4,4,0,global.skin_colors[global.skin_color_selected],1);
		} else {
			draw_sprite_ext(spr_player_front_walking_skin,0,x,y,4,4,0,c_white,1);
		}
		draw_sprite_ext(global.hair_styles_front_walk[global.hair_selected],-1,x,y,4,4,0,global.hair_colors[global.hair_color_selected],1);
		global.player_xscale = 1;
		break;
	case PLAYER_STATES.WALK_BACK:
		draw_sprite_ext(spr_player_back_walking_boots,-1,x,y,4,4,0,c_white,1);
		draw_sprite_ext(spr_player_back_walking_leggings,-1,x,y,4,4,0,c_white,1);
		draw_sprite_ext(spr_player_back_walking_shirt,-1,x,y,4,4,0,c_white,1);
		if (global.skin_color_selected != 6) {
			draw_sprite_ext(spr_player_back_walking_skin_colorless,0,x,y,4,4,0,global.skin_colors[global.skin_color_selected],1);
		} else {
			draw_sprite_ext(spr_player_back_walking_skin,0,x,y,4,4,0,c_white,1);
		}
		draw_sprite_ext(global.hair_styles_back_walk[global.hair_selected],-1,x,y,4,4,0,global.hair_colors[global.hair_color_selected],1);
		global.player_xscale = 1;
		break;
	case PLAYER_STATES.WALK_SIDE:
		draw_sprite_ext(spr_player_side_walking_boots,-1,x,y,global.player_xscale * 4,4,0,c_white,1);
		draw_sprite_ext(spr_player_side_walking_default,-1,x,y,global.player_xscale * 4,4,0,c_white,1);
		draw_sprite_ext(spr_player_side_walking_eye_colorless,-1,x,y,global.player_xscale * 4,4,0,global.eye_colors[global.eye_color_selected],1);
		draw_sprite_ext(spr_player_side_walking_leggings,-1,x,y,global.player_xscale * 4,4,0,c_white,1);
		draw_sprite_ext(spr_player_side_walking_shirt,-1,x,y,global.player_xscale * 4,4,0,c_white,1);
		if (global.skin_color_selected != 6) {
			draw_sprite_ext(spr_player_side_walking_skin_colorless,0,x,y,global.player_xscale * 4,4,0,global.skin_colors[global.skin_color_selected],1);
		} else {
			draw_sprite_ext(spr_player_side_walking_skin,0,x,y,global.player_xscale * 4,4,0,c_white,1);
		}
		draw_sprite_ext(global.hair_styles_side_walk[global.hair_selected],-1,x,y,global.player_xscale * 4,4,0,global.hair_colors[global.hair_color_selected],1);
		break;
}
