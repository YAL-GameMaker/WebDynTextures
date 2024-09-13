#define wdt_preinit
//#init wdt_preinit
global.__wdt_web = os_browser != browser_not_a_browser;
global.__wdt_status = ds_map_create(); /// @is {ds_map<texture, int>}
global.__wdt_async = ds_map_create(); /// @is {ds_map<sprite, texture>}
global.__wdt_sprite_number = ds_map_create(); /// @is {ds_map<sprite, int>}
global.__wdt_base_sprites = asset_get_ids(asset_sprite);
global.__wdt_base_fonts = asset_get_ids(asset_font);
//#macro wdt_status_ready 1
//#macro wdt_status_loading 0
//#macro wdt_status_fallback -1
//#macro wdt_status_error -2
wdt_preinit_raw();
if (wdt_magic_false()) gmcallback_wdt_preinit();

#define gmcallback_wdt_preinit
wdt_magic_false("draw_texture_flush", draw_texture_flush());

#define wdt_get_status_name
/// (status)->
switch (argument0) {
	case wdt_status_ready: return "ready";
	case wdt_status_loading: return "loading";
	case wdt_status_fallback: return "fallback";
	case wdt_status_error: return "error";
	default: return "status " + string(argument0);
}

#define wdt_async_image
/// ()
if (!global.__wdt_web) exit;

var _sprite = async_load[?"id"];
var _texture = global.__wdt_async[?_sprite];
if (_texture != undefined) {
	ds_map_delete(global.__wdt_async, _sprite);
	
	var _status = async_load[?"status"];
	var _path = wdt_get_image_path(_texture);
	if (_status < 0) {
		global.__wdt_status[?_path] = -1;
		exit;
	}
	var _new_texture = sprite_get_texture(_sprite, 0);
	var _new_path = wdt_get_image_path(_new_texture);
	global.__wdt_status[?_path] = 1;
	global.__wdt_status[?_new_path] = 1;
	
	wdt_assign_all(_texture, _new_texture);
}

#define wdt_load_texture
/// (texture)->
if (!global.__wdt_web) return false;

var _texture = argument0;
var _path = wdt_get_image_path(_texture);

// uh oh?
if (_path == undefined) return false;

// already loading/loaded?
if (global.__wdt_status[?_path] != undefined) return false;

var _new_path = wdt_change_ext(_path, ".orig.png");
show_debug_message("[wdt] Loading " + _new_path);

var _sprite = sprite_add(_new_path, 1, false, false, 0, 0);
global.__wdt_async[?_sprite] = _texture;

return true;

#define wdt_get_texture_status
/// (texture)->
if (!global.__wdt_web) return wdt_status_ready;

var _texture = argument0;
var _status = global.__wdt_status[?wdt_get_image_path(_texture)];
return _status != undefined ? _status : wdt_status_fallback;

#define wdt_load_sprite
/// (sprite, ?subimg)->
if (!global.__wdt_web) return 0;
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
if (!global.__wdt_web) return 0;
var _found = 0;
for (var i = 0; i < argument_count; i++) {
	_found += wdt_load_sprite(argument[i]);
}
return _found;

#define wdt_get_sprite_status
/// (sprite, ?subimg)->
if (!global.__wdt_web) return wdt_status_ready;
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

#define wdt_load_font
/// (font)->
if (!global.__wdt_web) return false;
var _font = argument0;
return wdt_load_texture(font_get_texture(_font));

#define wdt_get_font_status
/// (font)->
if (!global.__wdt_web) return wdt_status_ready;
var _font = argument0;
return wdt_get_texture_status(font_get_texture(_font));

#define wdt_get_sprite_texture_number
/// (sprite)
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

#define wdt_assign_all
/// (tx, ntx)~
var _tx = argument0, _ntx = argument1;
var _img = wdt_get_image(_tx);
var n, _found = 0;

var _sprites = global.__wdt_base_sprites;
n = array_length(_sprites);
for (var i = 0; i < n; i++) {
	var _sprite = _sprites[i];
	var _number = wdt_get_sprite_texture_number(_sprite);
	for (var k = 0; k < _number; k++) {
		var _itx = sprite_get_texture(_sprite, k);
		if (wdt_get_image(_itx) == _img) {
			_found += wdt_assign(_itx, _ntx);
		}
	}
}

var _fonts = global.__wdt_base_fonts;
n = array_length(_fonts);
for (var i = 0; i < n; i++) {
	var _font = _fonts[i];
	var _ftx = font_get_texture(_font);
	if (wdt_get_image(_ftx) == _img) {
		_found += wdt_assign(_ftx, _ntx);
	}
}

wdt_assign_raw(_tx, _ntx);

return _found;
