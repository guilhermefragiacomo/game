event_inherited();

hair_style_selected = global.hair_selected;
hair_color_selected = global.hair_color_selected;

skin_color_selected = global.skin_color_selected;

eye_color_selected = global.eye_color_selected;

player_name = global.player_name;

spd = 5;
player_state = PLAYER_STATES.STAND_FRONT;

my_path = path_add();

is_this_our_player = true;
player_number = 0;
check_if_player_is_connected = true;

is_playing = -1;

move_x = 0;
move_y = 0;

last_x = x;
last_y = y;

connected = true;

image_speed = 0.13;

input_form = id;
popup_response = 0;