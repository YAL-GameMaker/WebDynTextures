///~
function wdt_change_ext(path, newext) {
	return path.replace(/\.[^\\/.]+$/, "") + newext;
}
///~
function wdt_get_image_field(tx) {
	if (tx == null) return null;
	
	var cfd = tx.__wdt_image_field;
	if (cfd !== undefined) return cfd;
	
	for (var fd in tx) {
		if (!tx.hasOwnProperty(fd)) continue;
		var val = tx[fd];
		if (!(val instanceof HTMLImageElement)) continue;
		tx.__wdt_image_field = fd;
		return fd;
	}
	tx.__wdt_image_field = null;
	return null;
}
///~
function wdt_get_image(tx) {
	var fd = wdt_get_image_field(tx);
	return fd ? tx[fd] : null;
}
///~
function wdt_get_image_path(tx) {
	var img = wdt_get_image(tx);
	return img ? img.src : "";
}
///~
function wdt_assign(tx, ntx) {
	var cur_image = wdt_get_image(tx);
	if (cur_image == null) return 0;
	
	var new_image = wdt_get_image(ntx);
	if (new_image == null) return 0;
	
	for (var fd in tx) {
		if (!tx.hasOwnProperty(fd)) continue;
		var sub = tx[fd];
		
		// we don't want to change metadata in the img element
		if (sub == cur_image) {
			//tx[fd] = new_image;
			continue;
		}
		
		for (var sub_fd in sub) {
			if (!sub.hasOwnProperty(sub_fd)) continue;
			
			var val = sub[sub_fd];
			if (val == cur_image) {
				sub[sub_fd] = new_image;
				return 1;
			}
		}
	}
	return 1;
}

var wdt_raw_textures = null;
///~
function wdt_assign_raw(tx, ntx) {
	if (!wdt_raw_textures) return;
	var img = wdt_get_image(tx);
	var nimg = wdt_get_image(ntx);
	for (var i = 0; i < wdt_raw_textures.length; i++) {
		if (wdt_raw_textures[i] == img) wdt_raw_textures[i] = nimg;
	}
}

///~
function wdt_preinit_raw() {
	try {
		var ref_code = window.gml_Script_gmcallback_wdt_preinit.toString();
		var ref_rx = /"draw_texture_flush"\s*,\s*(\w+)/;
		var draw_texture_flush_name = ref_rx.exec(ref_code)[1];
		//
		var draw_texture_flush_code = window[draw_texture_flush_name].toString();
		var draw_texture_flush_rx = /(\w+)\s*\(\s*\)\s*;?\s*}\s*$/;
		var webgl_flush_name = draw_texture_flush_rx.exec(draw_texture_flush_code)[1];
		//
		var webgl_flush_code = window[webgl_flush_name].toString();
		var g_Textures_rx = /(\w+)\s*\.\s*length\b/;
		var g_Textures_name = g_Textures_rx.exec(webgl_flush_code)[1];
		wdt_raw_textures = window[g_Textures_name];
	} catch (x) {
		console.error("[wdt] Failed to locate raw texture array, not everything will work.", x);
	}
}

/// (...)~
function wdt_magic_false() {
	return false;
}
