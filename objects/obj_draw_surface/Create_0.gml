global.canva_color_selected = c_black;
global.canva_holding_color = false;
global.canva_brush_size = 3;
global.gui_depth = 1;
global.minigame_running = true;

fade = instance_create_layer(0, 0, layer_get_id("Instances"), obj_fade_gui);

finish = id;
save = id;

packet = 1;
send_packet = false;

popup_response = noone;

palette = instance_create_layer(0,0,layer_get_id("Layer0"),obj_canva_palette);

button1 = instance_create_layer(96,204,layer_get_id("Layer1"),obj_color_button_canva, 
{
	color : c_black,
	below : true
});
button2 = instance_create_layer(120,300,layer_get_id("Layer1"),obj_color_button_canva, 
{
	color : c_white
});

button3 = instance_create_layer(128,392,layer_get_id("Layer1"),obj_color_button_canva, 
{
	empty : true
});
button4 = instance_create_layer(116,488,layer_get_id("Layer1"),obj_color_button_canva, 
{
	empty : true
});


select_button = instance_create_layer(0,0,layer_get_id("Layer1"),obj_color_select_canva);

x_size = 320;
y_size = 180;

surf = surface_create(x_size, y_size);

buffer = buffer_create(4 * x_size * y_size, buffer_grow, 1);


mouse_x_previous = device_mouse_x_to_gui(0);
mouse_y_previous = device_mouse_y_to_gui(0);