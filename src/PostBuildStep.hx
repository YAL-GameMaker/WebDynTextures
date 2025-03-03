package;

import sys.io.Process;
import haxe.io.Path;
import sys.io.File;
import sys.FileSystem;
using StringTools;

class PostBuildStep {
	public static function main() {
		var env = Sys.environment();
		if (env["YYPLATFORM_name"] != "HTML5") {
			Sys.println("[wdt] This isn't web! Bye!");
			return;
		}
		//for (key => val in env) trace(key, val);
		//
		var extName = "web_dyn_tex";
		function extOpt(name, defValue:String):String {
			return env['YYEXTOPT_${extName}_$name'] ?? defValue;
		}
		function extOptNum(name, defValue:Float) {
			var opt = env['YYEXTOPT_${extName}_$name'];
			if (opt == null) return defValue;
			var val = Std.parseFloat(opt);
			return Math.isNaN(val) ? defValue : val;
		}
		var enable_post_build = extOpt("enable_post_build", "True").toLowerCase();
		if (enable_post_build != "true" && enable_post_build != "1") {
			Sys.println("[wdt] We've been asked not to do anything. Bye!");
			return;
		}
		//
		var magickPath = extOpt("magick", "magick");
		function runMagick(args) {
			Sys.command(magickPath, args);
		}
		//
		var html5game = env["YYoutputFolder"] + "/" + env["YYPLATFORM_option_html5_foldername"];
		//
		var fallback_mode = extOpt("fallback_mode", "Black");
		Sys.println("[wdt] Fallback mode is " + fallback_mode);
		Sys.println('[wdt] Output folder is "$html5game"');
		//
		var solid_hue = extOptNum("solid_hue", 0);
		var solid_hue_step = extOptNum("solid_hue_step", 0);
		var solid_saturation = extOpt("solid_saturation", "100");
		var solid_value = extOpt("solid_value", "100");
		//
		var silhouette_color = extOpt("silhouette_color", "#FFFFFF");
		var silhouette_alpha = extOpt("silhouette_alpha", "0.3");
		var silhouette_quality = extOpt("silhouette_quality", "30");
		//
		var lossy_color_quality = extOpt("lossy_color_quality", "10");
		var lossy_alpha_quality = extOpt("lossy_alpha_quality", "10");
		//
		var programDir = Path.directory(Sys.programPath());
		var fallbackPNG = Path.join([programDir, "fallbacktexture.png"]);
		var fallbackRGB = Path.withExtension(fallbackPNG, "rgb");
		if (!FileSystem.exists(fallbackRGB)) {
			runMagick([fallbackPNG, fallbackRGB]);
		}
		var fallbackBytes = File.getBytes(fallbackRGB);
		//
		for (rel in FileSystem.readDirectory(html5game)) {
			if (!rel.endsWith(".png")) continue;
			if (rel.endsWith(".orig.png")) continue;
			if (!rel.contains("_texture_")) continue;
			
			var full = html5game + "/" + rel;
			
			// is this the default texture? We don't want to compress that one... probably
			var skip = false;
			do {
				// first, it should be 64x64
				var sizePrefix = "size!!";
				var checkSize = new Process("magick", [
					"identify",
					"-ping",
					"-format", sizePrefix + "%[width];%[height]",
					full,
				]);
				if (checkSize.exitCode() != 0) continue;
				var sizeLine = checkSize.stdout.readLine();
				if (!sizeLine.startsWith(sizePrefix)) break;
				var sizePair = sizeLine.substr(sizePrefix.length).split(';');
				if (sizePair.length != 2) break;
				var width = Std.parseInt(sizePair[0]);
				if (width == null) break;
				var height = Std.parseInt(sizePair[1]);
				if (height == null) break;
				if (width != 64 || height != 64) break;
				//
				var fullRGB = Path.withExtension(full, "rgb");
				runMagick([
					full,
					fullRGB,
				]);
				var fullBytes = File.getBytes(fullRGB);
				skip = fallbackBytes.compare(fullBytes) == 0;
			} while (false);
			if (skip) {
				Sys.println('[wdt] Skipping "$rel", that\'s the fallback texture');
				continue;
			}
			
			var szOrig = FileSystem.stat(full).size;
			var orig = Path.withExtension(full, "orig.png");
			File.copy(full, orig);
			
			switch (fallback_mode) {
				case "Solid color": {
					runMagick([
						full,
						"-size", "%wx%h",
						'canvas:hsv($solid_hue,$solid_saturation%,$solid_value%)',
						"-composite",
						full,
					]);
					solid_hue = (solid_hue + solid_hue_step) % 360;
				};
				case "Transparent": {
					// combine with black, then wipe alpha
					runMagick([
						full,
						"-size", "%wx%h",
						"canvas:black",
						"-composite",
						"-alpha", "transparent",
						full,
					]);
				};
				case "Silhouette": {
					runMagick([
						full,
						"xc:" + silhouette_color,
						"-channel", "RGB",
						"-clut",
						"-channel", "A",
						"-fx", "u*" + silhouette_alpha,
						"-quality", "1",
						"-define", "webp:alpha-quality=" + silhouette_quality,
						"WEBP:" + full,
					]);
				};
				case "Lossy WEBP": {
					runMagick([
						full,
						"-quality", lossy_color_quality,
						"-define", "webp:alpha-quality=" + lossy_alpha_quality,
						"WEBP:" + full,
					]);
				};
				default: {
					Sys.println('[wdt] Unknown mode "$fallback_mode"!');
					break;
				}
			} // switch
			inline function printSize(sz) {
				var kb = sz / 1024;
				var unit = "KB";
				return Math.floor(kb * 100) / 100 + " KB";
			}
			var szFB = FileSystem.stat(full).size;
			var szPerc = Math.floor(szFB / szOrig * 1000) / 10 + "%";
			Sys.println('[wdt] Replaced "$rel", '
				+ '${printSize(szOrig)} -> ${printSize(szFB)}'
				+ ' ($szPerc of original)');
		} // for
	}
}