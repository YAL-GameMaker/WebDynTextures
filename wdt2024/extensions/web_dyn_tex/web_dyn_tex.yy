{
  "resourceType": "GMExtension",
  "resourceVersion": "1.2",
  "name": "web_dyn_tex",
  "optionsFile": "options.json",
  "options": [
    {"resourceType":"GMExtensionOption","resourceVersion":"1.0","name":"enable_post_build","extensionId":null,"guid":"a9643f3b-a726-4e01-90ac-82fe3bc8087d","displayName":"Enable post-build script","listItems":[],"description":"","defaultValue":"True","exportToINI":false,"hidden":false,"optType":0,},
    {"resourceType":"GMExtensionOption","resourceVersion":"1.0","name":"fallback_mode","extensionId":null,"guid":"48a65c99-e602-42de-9692-71a2015114c6","displayName":"Fallback textures","listItems":[
        "Silhouette",
        "Solid color",
        "Transparent",
        "Lossy WEBP",
      ],"description":"","defaultValue":"Silhouette","exportToINI":false,"hidden":false,"optType":6,},
    {"resourceType":"GMExtensionOption","resourceVersion":"1.0","name":"__extOptLabel","extensionId":null,"guid":"af100c81-b414-40a9-b9e9-c37219d04fc4","displayName":"","listItems":[],"description":"","defaultValue":"Solid color","exportToINI":false,"hidden":false,"optType":5,},
    {"resourceType":"GMExtensionOption","resourceVersion":"1.0","name":"solid_hue","extensionId":null,"guid":"07fc2aae-8982-4a02-bb75-d42bc817444c","displayName":"Starting hue","listItems":[],"description":"","defaultValue":"0","exportToINI":false,"hidden":false,"optType":1,},
    {"resourceType":"GMExtensionOption","resourceVersion":"1.0","name":"solid_hue_step","extensionId":null,"guid":"f57c847a-e40b-4e48-b476-1502829a0cf4","displayName":"Hue rotation stepº","listItems":[],"description":"","defaultValue":"57","exportToINI":false,"hidden":false,"optType":1,},
    {"resourceType":"GMExtensionOption","resourceVersion":"1.0","name":"solid_saturation","extensionId":null,"guid":"c7418499-1225-4329-b550-363d60e86543","displayName":"Saturation","listItems":[],"description":"","defaultValue":"100","exportToINI":false,"hidden":false,"optType":1,},
    {"resourceType":"GMExtensionOption","resourceVersion":"1.0","name":"solid_value","extensionId":null,"guid":"372167d4-1c02-4118-9f23-e170e5695b69","displayName":"Value","listItems":[],"description":"","defaultValue":"0","exportToINI":false,"hidden":false,"optType":1,},
    {"resourceType":"GMExtensionOption","resourceVersion":"1.0","name":"__extOptLabel1","extensionId":null,"guid":"9f85c68b-8511-4ebd-8800-bc26b7b1a328","displayName":"","listItems":[],"description":"","defaultValue":"Silhouette","exportToINI":false,"hidden":false,"optType":5,},
    {"resourceType":"GMExtensionOption","resourceVersion":"1.0","name":"silhouette_color","extensionId":null,"guid":"e5959387-fdf6-43fe-80cd-b8eb39d75264","displayName":"Color","listItems":[],"description":"","defaultValue":"#000000","exportToINI":false,"hidden":false,"optType":2,},
    {"resourceType":"GMExtensionOption","resourceVersion":"1.0","name":"silhouette_alpha","extensionId":null,"guid":"c3dd78d3-fb79-49f3-b0aa-df9bb8ea942c","displayName":"Alpha multiplier","listItems":[],"description":"","defaultValue":"0","exportToINI":false,"hidden":false,"optType":1,},
    {"resourceType":"GMExtensionOption","resourceVersion":"1.0","name":"silhouette_quality","extensionId":null,"guid":"3c60e6e0-995b-4570-bde2-23be58c05d0e","displayName":"WEBP Quality","listItems":[],"description":"","defaultValue":"10","exportToINI":false,"hidden":false,"optType":1,},
    {"resourceType":"GMExtensionOption","resourceVersion":"1.0","name":"__extOptLabel2","extensionId":null,"guid":"161598f1-7e4b-4206-9900-744b868548f4","displayName":"","listItems":[],"description":"","defaultValue":"Lossy WEBP","exportToINI":false,"hidden":false,"optType":5,},
    {"resourceType":"GMExtensionOption","resourceVersion":"1.0","name":"lossy_color_quality","extensionId":null,"guid":"d71f014c-f730-435d-a41e-f0bc4ffa631b","displayName":"Color quality","listItems":[],"description":"","defaultValue":"10","exportToINI":false,"hidden":false,"optType":1,},
    {"resourceType":"GMExtensionOption","resourceVersion":"1.0","name":"lossy_alpha_quality","extensionId":null,"guid":"8980adb3-d5d1-447f-800c-93d37fa91688","displayName":"Alpha quality","listItems":[],"description":"","defaultValue":"10","exportToINI":false,"hidden":false,"optType":1,},
  ],
  "exportToGame": true,
  "supportedTargets": -1,
  "extensionVersion": "0.0.1",
  "packageId": "",
  "productId": "",
  "author": "",
  "date": "2024-09-17T12:47:51.7774603+03:00",
  "license": "",
  "description": "",
  "helpfile": "",
  "iosProps": false,
  "tvosProps": false,
  "androidProps": false,
  "html5Props": false,
  "installdir": "",
  "files": [
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"","constants":[],"copyToTargets":17179869216,"filename":"web_dyn_textures.js","final":"","functions":[
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"wdt_change_ext","argCount":2,"args":[
            2,
            2,
          ],"documentation":"","externalName":"wdt_change_ext","help":"","hidden":true,"kind":11,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"wdt_load_texture_raw","argCount":2,"args":[
            2,
            2,
          ],"documentation":"","externalName":"wdt_load_texture_raw","help":"","hidden":true,"kind":11,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"wdt_is_null","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"wdt_is_null","help":"","hidden":true,"kind":11,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"wdt_get_image_field","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"wdt_get_image_field","help":"","hidden":true,"kind":11,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"wdt_get_image","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"wdt_get_image","help":"wdt_get_image(tx)->wdt_image","hidden":false,"kind":5,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"wdt_get_image_path","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"wdt_get_image_path","help":"wdt_get_image_path(tx)->string","hidden":false,"kind":5,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"wdt_assign","argCount":2,"args":[
            2,
            2,
          ],"documentation":"","externalName":"wdt_assign","help":"","hidden":true,"kind":11,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"wdt_assign_raw","argCount":2,"args":[
            2,
            2,
          ],"documentation":"","externalName":"wdt_assign_raw","help":"","hidden":true,"kind":11,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"wdt_preinit_raw","argCount":0,"args":[],"documentation":"","externalName":"wdt_preinit_raw","help":"","hidden":true,"kind":11,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"wdt_magic_false","argCount":-1,"args":[],"documentation":"","externalName":"wdt_magic_false","help":"","hidden":true,"kind":11,"returnType":2,},
      ],"init":"","kind":5,"order":[],"origname":"","ProxyFiles":[],"uncompress":false,"usesRunnerInterface":false,},
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"","constants":[
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"wdt_status_ready","hidden":false,"value":"1",},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"wdt_status_loading","hidden":false,"value":"0",},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"wdt_status_fallback","hidden":false,"value":"-1",},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"wdt_status_error","hidden":false,"value":"-2",},
      ],"copyToTargets":-1,"filename":"wdt_core.gml","final":"","functions":[
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"wdt_preinit","argCount":0,"args":[],"documentation":"","externalName":"wdt_preinit","help":"","hidden":true,"kind":11,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"gmcallback_wdt_preinit","argCount":0,"args":[],"documentation":"","externalName":"gmcallback_wdt_preinit","help":"","hidden":true,"kind":11,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"wdt_get_status_name","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"wdt_get_status_name","help":"wdt_get_status_name(status)->","hidden":false,"kind":2,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"wdt_async_image","argCount":0,"args":[],"documentation":"","externalName":"wdt_async_image","help":"wdt_async_image()","hidden":false,"kind":2,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"gmcallback_wdt_async_image","argCount":3,"args":[],"documentation":"","externalName":"gmcallback_wdt_async_image","help":"","hidden":true,"kind":11,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"wdt_load_texture","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"wdt_load_texture","help":"wdt_load_texture(texture)->","hidden":false,"kind":2,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"wdt_get_texture_status","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"wdt_get_texture_status","help":"wdt_get_texture_status(texture)->","hidden":false,"kind":2,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"wdt_assign_all","argCount":2,"args":[
            2,
            2,
          ],"documentation":"","externalName":"wdt_assign_all","help":"","hidden":true,"kind":11,"returnType":2,},
      ],"init":"wdt_preinit","kind":2,"order":[],"origname":"","ProxyFiles":[],"uncompress":false,"usesRunnerInterface":false,},
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"","constants":[],"copyToTargets":-1,"filename":"wdt_assets.gml","final":"","functions":[
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"wdt_load_sprite","argCount":-1,"args":[],"documentation":"","externalName":"wdt_load_sprite","help":"wdt_load_sprite(sprite, ?subimg)->","hidden":false,"kind":2,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"wdt_load_sprites","argCount":-1,"args":[],"documentation":"","externalName":"wdt_load_sprites","help":"wdt_load_sprites(...sprites)->","hidden":false,"kind":2,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"wdt_get_sprite_status","argCount":-1,"args":[],"documentation":"","externalName":"wdt_get_sprite_status","help":"wdt_get_sprite_status(sprite, ?subimg)->","hidden":false,"kind":2,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"wdt_get_sprite_texture_number","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"wdt_get_sprite_texture_number","help":"wdt_get_sprite_texture_number(sprite)->","hidden":false,"kind":2,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"wdt_load_font","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"wdt_load_font","help":"wdt_load_font(font)->","hidden":false,"kind":2,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"wdt_get_font_status","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"wdt_get_font_status","help":"wdt_get_font_status(font)->","hidden":false,"kind":2,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"wdt_load_tileset","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"wdt_load_tileset","help":"wdt_load_tileset(tileset)->","hidden":false,"kind":2,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"wdt_get_tileset_status","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"wdt_get_tileset_status","help":"wdt_get_tileset_status(font)->","hidden":false,"kind":2,"returnType":2,},
      ],"init":"","kind":2,"order":[],"origname":"","ProxyFiles":[],"uncompress":false,"usesRunnerInterface":false,},
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"","constants":[],"copyToTargets":-1,"filename":"wdt_texture_groups.gml","final":"","functions":[
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"wdt_load_texture_group","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"wdt_load_texture_group","help":"wdt_load_texture_group(texturegroup_name)->","hidden":false,"kind":2,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"wdt_get_texture_group_status","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"wdt_get_texture_group_status","help":"wdt_get_texture_group_status(texturegroup_name)->","hidden":false,"kind":2,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"wdt_get_texture_group_image_pairs","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"wdt_get_texture_group_image_pairs","help":"wdt_get_texture_group_image_pairs(name)->array<[string,texture]>","hidden":false,"kind":2,"returnType":2,},
      ],"init":"","kind":2,"order":[],"origname":"","ProxyFiles":[],"uncompress":false,"usesRunnerInterface":false,},
  ],
  "HTML5CodeInjection": "",
  "classname": "",
  "tvosclassname": null,
  "tvosdelegatename": null,
  "iosdelegatename": "",
  "androidclassname": "",
  "sourcedir": "",
  "androidsourcedir": "",
  "macsourcedir": "",
  "maccompilerflags": "",
  "tvosmaccompilerflags": "",
  "maclinkerflags": "",
  "tvosmaclinkerflags": "",
  "iosplistinject": "",
  "tvosplistinject": "",
  "androidinject": "",
  "androidmanifestinject": "",
  "androidactivityinject": "",
  "gradleinject": "",
  "androidcodeinjection": "",
  "hasConvertedCodeInjection": true,
  "ioscodeinjection": "",
  "tvoscodeinjection": "",
  "iosSystemFrameworkEntries": [],
  "tvosSystemFrameworkEntries": [],
  "iosThirdPartyFrameworkEntries": [],
  "tvosThirdPartyFrameworkEntries": [],
  "IncludedResources": [],
  "androidPermissions": [],
  "copyToTargets": -1,
  "iosCocoaPods": "",
  "tvosCocoaPods": "",
  "iosCocoaPodDependencies": "",
  "tvosCocoaPodDependencies": "",
  "parent": {
    "name": "Extensions",
    "path": "folders/Extensions.yy",
  },
}