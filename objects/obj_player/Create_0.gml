event_inherited();

enum PLAYER_STATES {
	STAND_FRONT,
	STAND_SIDE,
	STAND_BACK,
	WALK_FRONT,
	WALK_SIDE,
	WALK_BACK
}

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