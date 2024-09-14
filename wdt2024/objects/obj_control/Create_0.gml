wdt_load_font(fnt_test);
str = "";
key = 0;
test_button = function(_label) /*=>*/ {
	var _key = key++;
	str += "\n[" + chr(_key) + "] " + _label;
	return keyboard_check_pressed(_key);
}
test_texture = function(_label, _status) /*=>*/ {
	return test_button(_label + " (" + wdt_get_status_name(_status) + ")");
}
test_sprite = function(_label, _sprite) /*=>*/ {
	if (test_texture(_label, wdt_get_sprite_status(_sprite))) {
		wdt_load_sprite(_sprite);
	}
}
test_tileset = function(_label, _sprite) /*=>*/ {
	if (test_texture(_label, wdt_get_tileset_status(_sprite))) {
		wdt_load_tileset(_sprite);
	}
}
test_group = function(_label, _group) /*=>*/ {
	if (test_texture(_label, wdt_get_texture_group_status(_group))) {
		wdt_load_texture_group(_group);
	}
}
show_debug_message(texturegroup_get_textures("Default"));