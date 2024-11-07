var _data = ds_map_create();
	
ds_map_add(_data, "minigame_id", global.game);
ds_map_add(_data, "player_number", global.player_number);
	
send_player_over_udp(8080, 100, _data, MSG_TYPE.REMOVE_PLAYER_FROM_MINIGAME);
global.game = -1;
global.players_in_minigame = [];
global.gui_depth = 0;
global.show_gui = false;
global.lock = false;
instance_destroy(self);