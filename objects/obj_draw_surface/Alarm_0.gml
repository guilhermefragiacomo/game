var _painting = buffer_base64_encode(buffer, 0, buffer_get_size(buffer));
var _painting_str;

switch (packet) {
	case 1:
		_painting_str = string_copy(_painting, 1, buffer_get_size(buffer)/6);
		break;
	case 2:
		_painting_str =  string_copy(_painting, buffer_get_size(buffer)/6+1, buffer_get_size(buffer)/6);
		break;
	case 3:
		_painting_str = string_copy(_painting, buffer_get_size(buffer)/3+1, buffer_get_size(buffer)/6);
		break;
	case 4:
		_painting_str = string_copy(_painting, buffer_get_size(buffer)/3 + buffer_get_size(buffer)/6+1, buffer_get_size(buffer)/6);
		break;
	case 5:
		_painting_str = string_copy(_painting,  buffer_get_size(buffer)/3 + buffer_get_size(buffer)/3 + 1, buffer_get_size(buffer)/6);
		break;
	case 6:
		_painting_str = string_copy(_painting, buffer_get_size(buffer)/3 + buffer_get_size(buffer)/3 + buffer_get_size(buffer)/6 + 1, buffer_get_size(buffer)/6);
		break;
	default:
		_painting_str = "wrong packet";
		show_debug_message("finished or wrong packet number");
		break;
}
show_debug_message(packet);
show_debug_message(string_length(_painting_str));
show_debug_message(_painting_str);

if (packet <= 6) {
	var _data = ds_map_create();
	ds_map_add(_data, "player_number", global.player_number);
	ds_map_add(_data, "player_name", global.player_name);
	ds_map_add(_data, "packet", packet);
	ds_map_add(_data, "success", false);
	ds_map_add(_data, "painting", _painting_str);
	send_player_over_udp(8080, buffer_get_size(buffer)/4 + 400, _data, MSG_TYPE.SAVE_PAINTING);
	ds_map_destroy(_data);
}

if (send_packet == true) {
	alarm[0] = game_get_speed(gamespeed_fps)/3;
}