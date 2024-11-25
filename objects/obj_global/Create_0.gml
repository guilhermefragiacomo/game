global.client = network_create_socket(network_socket_udp);

enum MSG_TYPE{
	CREATE_HOST,
	JOIN_HOST,
	STOP_HOST,
	SET_PLAYER_STAT,
	GET_HOSTS,
	GET_PLAYER_STAT,
	GET_NEW_PLAYER,
	CHECK_DISCONNECTED,
	GET_MINIGAMES,
	SET_MINIGAMES,
	REMOVE_PLAYER_FROM_MINIGAME,
	START_MINIGAME,
	UPDATE_PLAYER_VALUE,
	SAVE_PLAYER,
	SAVE_PAINTING
}

global.host_number = noone;
global.player_number = noone;

global.lock = false;

global.gui_depth = 0;

global.player_limit = 0;
global.game = -1;
global.players_in_minigame = [];
global.show_gui = false;
global.counter = 0;
global.minigame_running = false;

global.hair_colors = [
	c_white,
	#777777,
	#9955ff,
	#00ff00,
	#dd7733,
	c_red,
	#ffff00,
	c_aqua,
	#ff55ff
];

global.skin_colors = [
	#bbbbbb,
	#555555,
	#333333,
	#9900ff,
	#00ab00,
	#dd7733,
	#ff9966,
	#ffbb88,
	#774433,
	#772211,
	#dd3333,
	#ffcc00,
	#00bbff,
	#ff55ff
];

global.eye_colors = [
	c_white,
	#777777,
	#ff55ff,
	#00ff00,
	#dd7733,
	#ff0000,
	#ffff66,
	c_aqua,
];

global.hair_styles_front_walk = [
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
global.hair_styles_back_walk = [
	spr_player_back_walking_hair_1,
	spr_player_back_walking_hair_2,
	spr_player_back_walking_hair_3,
	spr_player_back_walking_hair_4,
	spr_player_back_walking_hair_5,
	spr_player_back_walking_hair_6,
	spr_player_back_walking_hair_7,
	spr_player_back_walking_hair_8,
	spr_player_back_walking_hair_9,
	spr_player_back_walking_hair_10,
	spr_player_back_walking_hair_11,
	spr_player_back_walking_hair_12,
	spr_player_back_walking_hair_13,
	spr_player_back_walking_hair_14,
	spr_player_back_walking_hair_15,
	spr_player_back_walking_hair_16,
	spr_player_back_walking_hair_17,
	spr_player_back_walking_hair_18,
	spr_player_back_walking_hair_19,
	spr_player_back_walking_hair_20,
	spr_player_back_walking_hair_21,
	spr_player_back_walking_hair_22,
	spr_player_back_walking_hair_23,
	spr_player_back_walking_hair_24,
	spr_player_back_walking_hair_25,
	spr_player_back_walking_hair_26,
	spr_player_back_walking_hair_27
];
global.hair_styles_side_walk = [
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

enum PLAYER_STATES {
	STAND_FRONT,
	STAND_SIDE,
	STAND_BACK,
	WALK_FRONT,
	WALK_SIDE,
	WALK_BACK
}