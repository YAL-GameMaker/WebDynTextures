draw_set_font(fnt_test);
draw_set_color(c_white);
str = "You can load things:";
key = ord("1");
ui_sprite("Background", spr_background);
ui_sprite("Bee", spr_bee);
ui_sprite("Thinking", spr_thinking);
draw_text(5, 5, str);