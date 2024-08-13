var _grid = global.grid_depth;
var _num = instance_number(obj_par_objects);

ds_grid_resize(_grid, 2, _num);

var _i = 0;
with(obj_par_objects) {
	_grid[# 0, _i] = id;
	_grid[# 1, _i] = y;
	_i++;
}

ds_grid_sort(_grid, 1, true);

for (var _k = 0; _k < ds_grid_height(_grid); _k++) {
	var _inst = _grid[# 0, _k];
	with(_inst) {
		if (overlay != spr_bush) {
			draw_sprite(overlay,0,x,y);
		}
	}
}	

for (var _e = 0; _e < ds_grid_height(_grid); _e++) {
	var _inst = _grid[# 0, _e];
	with(_inst) {
		event_perform(ev_draw, 0);
	}
}