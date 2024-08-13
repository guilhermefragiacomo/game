player_width = sprite_get_bbox_right(spr_player_front) - sprite_get_bbox_left(spr_player_front);
player_height = sprite_get_bbox_bottom(spr_player_front) - sprite_get_bbox_top(spr_player_front);

h_cells = room_width div player_width;
v_cells = room_height div player_height;

global.my_grid = mp_grid_create(0,0, h_cells, v_cells, player_width, player_height);

mp_grid_add_instances(global.my_grid, obj_wall_grid, true);

