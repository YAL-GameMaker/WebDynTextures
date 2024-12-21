# Web Dynamic Textures

**Quick links:** [documentation](https://yal.cc/docs/gm/web_dyn_textures/) · [itch](https://yellowafterlife.itch.io/gamemaker-web-dyn-textures)  
**Versions:** GM2022+, GM LTS (see Known Issues)  
**Platforms:** HTML5 (has fallbacks for other platforms)

A dynamic texture page loading system for HTML5 games in GameMaker!

During compilation it replaces the original texture pages with fallback ones (such as transparent, silhouette, or lossy-encoded) and then you can load the "real" texture pages when you need them!

This speeds up the game's initial load time and can save bandwidth on textures that the player may or may not see in a playthrough.

You might find this particularly useful if you are making games for platforms with harsh "initial load time/size" requirements _or_ if your game is pretty big, but it's an all-around convenience.

## Historical context

The first iteration of this extension was made all the way back in 2017 for a client,
licensed non-exclusively as a second client asked about this same thing while I was making it.

As far as I'm aware, neither of those games came out in the end,
and I was pivoting away from JS/web work to porting/multiplayer at the time,
so no one else asked about this for a while and eventually I all but forgot about it.

Fast-forward to September 2024,
I'm digging through my "old projects" folder,
look at the extension and think "hm, this could be useful for _at least_ one project I know of".

This version is a complete rewrite that also takes advantage of build scripts in recent GameMaker versions to replace textures even when you are doing test runs from the editor.

## Technical

When you do a `*_get_texture` call on assets,
GM runtime [returns you a JS object](https://github.com/YoYoGames/GameMaker-HTML5/blob/46302b315827c051c1e40a462fa1879cffa43222/scripts/functions/Function_Layers.js#L3878)
with WebGLTexture and TPE fields, texture coming from a TPE sub-field.

This is not very useful on its own because those variable names will be minified,
but we can figure out which one is which because the texture is always an `<img>` element.

And thus, when we load a replacement texture,
we can go over all of the sprites/fonts/etc.,
grab their textures,
and replace the texture reference inside their TPEs by a new one
if they're using the one that we want to replace.

---

But that's not all! Sometimes (e.g. for Spine),
GameMaker references textures by ID inside the `g_Textures` array.

I could not come up with a better solution to this than retrieving the array
by running regular expressions on `func.toString()` of a few built-in functions.
Should this part fail, the extension will still work for most use cases (and first version didn't do this at all).

---

The rest of the extension's code is caching, utility functions, and alike.

## _Doesn't GM have dynamic texture groups now?_

Generally yes, but not on HTML5 (for now?)

But also the out-of-box implementation will likely use a fixed fallback texture rather than adjustable options like I have it here.

## Known issues

In LTS2022, Spine sprites are given personal texture pages
and `sprite_get_texture` returns `null` for them,
meaning that extension cannot update them.
This will likely be fixed in LTS2025.

For now, these textures are left untouched and will be loaded by GM as usual.

## Meta

- An extension by YellowAfterlife
- Originally commissioned for [Soulbound](https://soulbound.game)
- The build script is written in Haxe!