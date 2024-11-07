global.canva_color_selected = c_black;
global.gui_depth = 1;

instance_create_depth(96,204,-300,obj_color_button_canva, 
{
	color : c_black,
	below : true
});
instance_create_depth(120,300,-300,obj_color_button_canva, 
{
	color : c_white
});
/*
instance_create_depth(128,392,-300,obj_color_button_canva, 
{
	color : c_blue
});
instance_create_depth(116,488,-300,obj_color_button_canva, 
{
	color : c_white
});
*/

instance_create_depth(0,0,-300,obj_color_select_canva);

x_size = 320;
y_size = 180;

surf = surface_create(x_size, y_size);

brush_size = 3;

buffer = buffer_create(4 * x_size * y_size, buffer_grow, 1);


mouse_x_previous = device_mouse_x_to_gui(0);
mouse_y_previous = device_mouse_y_to_gui(0);