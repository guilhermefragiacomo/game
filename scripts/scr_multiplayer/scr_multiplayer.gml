function send_player_over_udp(_port, _size, _map, _type, _ip = "127.0.0.1"){
	network_connect_raw(global.client, _ip, _port);
	var _player_buffer = buffer_create(_size, buffer_fixed, _size);
	
	ds_map_add(_map, "type", _type);
	var _data_json = json_encode(_map);
	//show_debug_message("> " + _data_json);
	ds_map_destroy(_map);
	
	buffer_seek(_player_buffer, buffer_seek_start, 0);
	buffer_write(_player_buffer, buffer_text, _data_json);
	network_send_udp_raw(global.client, _ip,_port, _player_buffer, buffer_tell(_player_buffer));
}