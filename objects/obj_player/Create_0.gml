event_inherited();

enum PLAYER_STATES {
	STAND_FRONT,
	STAND_SIDE,
	STAND_BACK,
	WALK_FRONT,
	WALK_SIDE,
	WALK_BACK
}

hair_style_selected = 0;
hair_styles_front_walk = [
	spr_player_front_walking_hair_1,
	spr_player_front_walking_hair_2,
	spr_player_front_walking_hair_3,
	spr_player_front_walking_hair_4,
	spr_player_front_walking_hair_5,
	spr_player_front_walking_hair_6,
	spr_player_front_walking_hair_7,
	spr_player_front_walking_hair_8,
	spr_player_front_walking_hair_9,
	spr_player_front_walking_hair_10,
	spr_player_front_walking_hair_11,
	spr_player_front_walking_hair_12,
	spr_player_front_walking_hair_13,
	spr_player_front_walking_hair_14,
	spr_player_front_walking_hair_15,
	spr_player_front_walking_hair_16,
	spr_player_front_walking_hair_17,
	spr_player_front_walking_hair_18,
	spr_player_front_walking_hair_19,
	spr_player_front_walking_hair_20,
	spr_player_front_walking_hair_21,
	spr_player_front_walking_hair_22,
	spr_player_front_walking_hair_23,
	spr_player_front_walking_hair_24,
	spr_player_front_walking_hair_25,
	spr_player_front_walking_hair_26,
	spr_player_front_walking_hair_27
];
hair_styles_back_walk = [];
hair_styles_side_walk = [
	spr_player_side_walking_hair_1,
	spr_player_side_walking_hair_2,
	spr_player_side_walking_hair_3,
	spr_player_side_walking_hair_4,
	spr_player_side_walking_hair_5,
	spr_player_side_walking_hair_6,
	spr_player_side_walking_hair_7,
	spr_player_side_walking_hair_8,
	spr_player_side_walking_hair_9,
	spr_player_side_walking_hair_10,
	spr_player_side_walking_hair_11,
	spr_player_side_walking_hair_12,
	spr_player_side_walking_hair_13,
	spr_player_side_walking_hair_14,
	spr_player_side_walking_hair_15,
	spr_player_side_walking_hair_16,
	spr_player_side_walking_hair_17,
	spr_player_side_walking_hair_18,
	spr_player_side_walking_hair_19,
	spr_player_side_walking_hair_20,
	spr_player_side_walking_hair_21,
	spr_player_side_walking_hair_22,
	spr_player_side_walking_hair_23,
	spr_player_side_walking_hair_24,
	spr_player_side_walking_hair_25,
	spr_player_side_walking_hair_26,
	spr_player_side_walking_hair_27
];

hair_color_selected = 0;
var _black = #777777;
var _green = #00ff00;
var _yellow = #ffff00;
var _blue = #8888ff;
hair_colors = [
	c_white,
	_black,
	_blue,
	_green,
	c_orange,
	c_red,
	_yellow,
	c_aqua
];

player_values = {
	spd : 5,
}

spd = 5;
player_state = PLAYER_STATES.STAND_FRONT;

my_path = path_add();

umavez = true;

is_this_our_player = true;
player_number = 0;
check_if_player_is_connected = true;

move_x = 0;
move_y = 0;

last_x = x;
last_y = y;

image_speed = 0.1;