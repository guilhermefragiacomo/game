if (string_length(keyboard_string)>string_max) {
	keyboard_string = string_copy(keyboard_string, 1, string_max);
}