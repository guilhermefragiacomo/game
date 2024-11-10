if (global.canva_color_created != c_white) {
	hue = color_get_hue(global.canva_color_created);
	sat = color_get_saturation(global.canva_color_created);
	val = color_get_value(global.canva_color_created);
} else {
	hue = 0;
	sat = 255;
	val = 255;
}

prop = 355/254;
prop2 = 355/255;

color_before = global.canva_color_created;