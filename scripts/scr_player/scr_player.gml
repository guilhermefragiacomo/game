function input_check(){
	move_x = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) * spd;
	move_y = (keyboard_check(ord("S")) - keyboard_check(ord("W"))) * spd;
	
	if (move_x == 0) {
		move_x = (keyboard_check(vk_right) - keyboard_check(vk_left)) * spd;
	}
	if (move_y == 0) {
		move_y = (keyboard_check(vk_down) - keyboard_check(vk_up)) * spd;
	}
}

function movement_animation () {
	
	if (move_x != 0) {
		path_delete(my_path);
		my_path = path_add();
		if (move_y != 0) {
			move_x *=  1/sqrt(2);
			move_y *=  1/sqrt(2);
		}
		player_state = PLAYER_STATES.WALK_SIDE;
		image_xscale = sign(move_x);
	} else {
		if (last_y > y || move_y < 0) {
			player_state = PLAYER_STATES.WALK_BACK;
		} else {
			if (last_y < y || move_y > 0) {
				player_state = PLAYER_STATES.WALK_FRONT;
			} else {
				if (last_x != x || move_x != 0) {
					player_state = PLAYER_STATES.WALK_SIDE;
					image_xscale = sign(x - last_x);
				} else {
					if (player_state == PLAYER_STATES.WALK_FRONT || player_state == PLAYER_STATES.STAND_FRONT) {
						player_state = PLAYER_STATES.STAND_FRONT;
					} else {
						if (player_state == PLAYER_STATES.WALK_BACK || player_state == PLAYER_STATES.STAND_BACK) {
							player_state = PLAYER_STATES.STAND_BACK;
						} else {
							player_state = PLAYER_STATES.STAND_SIDE;
						}
					}
				}
			}
		}
	}
	collision();
}

function collision() {
	if(place_meeting(x + move_x, y, obj_wall)){
		path_delete(my_path);
		my_path = path_add();
		while(!place_meeting(x + sign(move_x), y, obj_wall))
		{
			x += sign(move_x);
		}
		move_x = 0;
	}
	var _instx = instance_place(x + move_x, y, obj_walk_through);
	if(_instx && _instx.collision){
		if (y < _instx.bbox_bottom) {
			move_x = 0;
			path_delete(my_path);
			my_path = path_add();
		}
	}
	
	if (move_y < 0) {
		var _inst = instance_place(x, y + move_y, obj_walk_through);
		if (_inst && _inst.collision) {
			if (y + move_y <= _inst.bbox_bottom+2) {
				move_y = 0;
				path_delete(my_path);
				my_path = path_add();
			}
		}
	} else {
		if (move_y > 0) {
			var _inst = instance_place(x, y + move_y, obj_walk_through);
			if (_inst && _inst.collision) {
				if (y + move_y >= _inst.bbox_top-2) {
					if (y + move_y <= _inst.bbox_bottom) {
						path_delete(my_path);
						my_path = path_add();
						move_y = 0;
					}
				}
			}
		}
	}
	
	last_x = x;
	x += round(move_x);

	if(place_meeting(x, y + move_y, obj_wall)) {
		path_delete(my_path);
		my_path = path_add();
		while(!place_meeting(x, y + sign(move_y), obj_wall))
		{
			y += sign(move_y);
		}
		move_y = 0;
	}
	
	last_y = y;
	y += round(move_y);
}

function get_player_states() {
	var _data = ds_map_create();
	ds_map_add(_data, "host_number", global.host_number);
	ds_map_add(_data, "player_number", player_number);
	ds_map_add(_data, "player_stat", noone);
	send_player_over_udp(8080, 300, _data, MSG_TYPE.GET_PLAYER_STAT);
}

function set_player_states() {
	var _data = ds_map_create();
	
	ds_map_add(_data, "move_x", move_x);
	ds_map_add(_data, "move_y", move_y);
	ds_map_add(_data, "x", x);
	ds_map_add(_data, "y", y);
	ds_map_add(_data, "host_number", global.host_number);
	ds_map_add(_data, "player_number", global.player_number);
	ds_map_add(_data, "player_name", global.player_name);
	ds_map_add(_data, "hair_style_selected", hair_style_selected);
	ds_map_add(_data, "hair_color_selected", hair_color_selected);
	ds_map_add(_data, "skin_color_selected", skin_color_selected);
	ds_map_add(_data, "eye_color_selected", eye_color_selected);
	ds_map_add(_data, "connected", connected);
	
	send_player_over_udp(8080, 1000, _data, MSG_TYPE.SET_PLAYER_STAT);
}