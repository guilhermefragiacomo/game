/*
function send_player_over_udp(_port, _size, _map, _type, _alignment = _size, _ip = "127.0.0.1"){
	network_connect_raw(global.client, _ip, _port);
	var _player_buffer = buffer_create(_size, buffer_fixed, _alignment);
	
	ds_map_add(_map, "type", _type);
	var _data_json = json_encode(_map);
	//show_debug_message("> " + _data_json);
	ds_map_destroy(_map);
	
	buffer_seek(_player_buffer, buffer_seek_start, 0);
	buffer_write(_player_buffer, buffer_text, _data_json);
	network_send_udp_raw(global.client, _ip,_port, _player_buffer, buffer_tell(_player_buffer));
}
*/
function send_player_over_udp(_port, _size, _map, _type, _alignment = 1, _ip = "127.0.0.1") {
    // Ensure alignment is valid (power of 2)
    if (_alignment < 1 || (_alignment & (_alignment - 1)) != 0) {
        _alignment = 1; // Default to 1 if invalid
    }
    
    // Connect to the server
    network_connect_raw(global.client, _ip, _port);
    
    // Create the buffer with valid alignment
    var _player_buffer = buffer_create(_size, buffer_fixed, _alignment);
    
    // Add the "type" key to the map
    ds_map_add(_map, "type", _type);
    
    // Encode the map as JSON
    var _data_json = json_encode(_map);
    ds_map_destroy(_map); // Destroy the map after encoding it to JSON
    
    // Write JSON data to the buffer
    buffer_seek(_player_buffer, buffer_seek_start, 0);
    buffer_write(_player_buffer, buffer_text, _data_json);
    
    // Send the buffer via UDP
    network_send_udp_raw(global.client, _ip, _port, _player_buffer, buffer_tell(_player_buffer));
    
    // Clean up the buffer
    buffer_delete(_player_buffer);
}
