#define wdt_load_sprite
/// (sprite, ?subimg)->
if (global.__wdt_native) return 0;
var _sprite = argument[0];
var _subimg = argument_count > 1 ? argument[1] : undefined;

if (_subimg != undefined) {
	var _itx = sprite_get_texture(_sprite, _subimg);
	return wdt_load_texture(_itx) ? 1 : 0;
}

var _found = 0;
var _number = wdt_get_sprite_texture_number(_sprite);
for (var i = 0; i < _number; i++) {
	var _itx = sprite_get_texture(_sprite, i);
	if (wdt_load_texture(_itx)) _found += 1;
}
return _found;

#define wdt_load_sprites
/// (...sprites)->
if (global.__wdt_native) return 0;
var _found = 0;
for (var i = 0; i < argument_count; i++) {
	_found += wdt_load_sprite(argument[i]);
}
return _found;

#define wdt_get_sprite_status
/// (sprite, ?subimg)->
if (global.__wdt_native) return wdt_status_ready;
var _sprite = argument[0];
var _subimg = argument_count > 1 ? argument[1] : undefined;
if (_subimg != undefined) {
	return wdt_get_texture_status(sprite_get_texture(_sprite, _subimg));
}
var _min = wdt_status_ready;
var _number = wdt_get_sprite_texture_number(_sprite);
for (var i = 0; i < _number; i++) {
	var _status = wdt_get_texture_status(sprite_get_texture(_sprite, i));
	if (_status == wdt_status_error) return _status;
	_min = min(_min, _status);
}
return _min;

#define wdt_get_sprite_texture_number
/// (sprite)->
var _sprite = argument0;
var n = global.__wdt_sprite_number[?_sprite];
if (n != undefined) return n;
var _inf = sprite_get_info(_sprite);
switch (_inf.type) {
	case 0: n = _inf.num_subimages; break;
	case 1: n = 0; break; // SWF
	case 2: n = 1; break; // Spine
	default: n = 0; break;
}
if (n == 2147483647) n = 1; // we have been deceived
global.__wdt_sprite_number[?_sprite] = n;
return n;

#define wdt_load_font
/// (font)->
if (global.__wdt_native) return false;
var _font = argument0;
return wdt_load_texture(font_get_texture(_font));

#define wdt_get_font_status
/// (font)->
if (global.__wdt_native) return wdt_status_ready;
var _font = argument0;
return wdt_get_texture_status(font_get_texture(_font));

#define wdt_load_tileset
/// (tileset)->
if (global.__wdt_native) return false;
var _tileset = argument0;
return wdt_load_texture(tileset_get_texture(_tileset));

#define wdt_get_tileset_status
/// (font)->
if (global.__wdt_native) return wdt_status_ready;
var _tileset = argument0;
return wdt_get_texture_status(tileset_get_texture(_tileset));
