wdt_load_font(fnt_test);
str = "";
key = 0;
ui_button = function(_label) /*=>*/ {
	var _key = key++;
	str += "\n[" + chr(_key) + "] " + _label;
	return keyboard_check_pressed(_key);
}
ui_texture = function(_label, _status) /*=>*/ {
	return ui_button(_label + " (" + wdt_get_status_name(_status) + ")");
}
ui_sprite = function(_label, _sprite) /*=>*/ {
	if (ui_texture(_label, wdt_get_sprite_status(_sprite))) {
		wdt_load_sprite(_sprite);
	}
}