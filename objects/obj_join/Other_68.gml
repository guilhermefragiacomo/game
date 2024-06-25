if (async_load[? "size"] > 0) {
	var _buff = async_load[? "buffer"];
	buffer_seek(_buff, buffer_seek_start, 0);
	var _message_id = buffer_read(_buff, buffer_string);
	
	var _response = json_decode(_message_id);
	
	if (ds_map_find_value(_response, "type") == MSG_TYPE.GET_HOSTS) {
		show_debug_message("< " + _message_id);
		var _hosts = ds_map_find_value(_response, "hosts");
		var _number_of_hosts = ds_list_size(_hosts);
		var _host;
		var _number_of_players;
		var _host_button;
		for (var _i = 0; _i < _number_of_hosts; ++_i) {
		    _host = ds_list_find_value(_hosts, _i);
			_number_of_players = ds_list_size(_host);
			_host_button = instance_create_layer(10, 64 + (_i * 64) + (_i * 10), "Instances", obj_hosts_button);
			_host_button.local_host_number = _i;
			_host_button.local_number_of_player = _number_of_players;
			did_we_received_hosts = true;
		}
	}
}