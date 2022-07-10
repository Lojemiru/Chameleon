


draw_rectangle_color(x + 2, y + 7, x + sprite_width - 2, y + 8, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
draw_rectangle_color(x + 2, y + 7, x + ((sprite_width - 2) * global.mix), y + 8, c_white, c_white, c_silver, c_silver, false);
draw_rectangle_color(x + 1 + ((sprite_width - 3) * global.mix), y + 4, x + ((sprite_width - 3) * global.mix) + 2, y + 11, c_gray, c_gray, c_gray, c_gray, false);

draw_set_halign(fa_left);
draw_text(x + 2, y - 3, "Mix: " + string(round(global.mix * 100)) + "%");
