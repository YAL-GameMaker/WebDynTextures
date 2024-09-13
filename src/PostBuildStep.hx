package;

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
		var html5game = env["YYoutputFolder"] + "/html5game";
		var defTexture = env["YYprojectName"] + "_texture_0.png";
		//
		var fallback_mode = extOpt("fallback_mode", "Black");
		Sys.println("[wdt] Fallback mode is " + fallback_mode);
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
		for (rel in FileSystem.readDirectory(html5game)) {
			if (!rel.endsWith(".png")) continue;
			if (rel.endsWith(".orig.png")) continue;
			if (!rel.contains("_texture_")) continue;
			if (rel == defTexture) continue;
			
			var full = html5game + "/" + rel;
			File.copy(full, Path.withExtension(full, "orig.png"));
			
			switch (fallback_mode) {
				case "Solid color": {
					Sys.command("magick", [
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
					Sys.command("magick", [
						full,
						"-size", "%wx%h",
						"canvas:black",
						"-composite",
						"-alpha", "transparent",
						full,
					]);
				};
				case "Silhouette": {
					Sys.command("magick", [
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
					Sys.command("magick", [
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
				Sys.println('[wdt] Replaced $rel');
			}
		}
	}
}