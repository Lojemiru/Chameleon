


draw_rectangle_color(x + 2, y + 7, x + sprite_width - 2, y + 8, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
draw_rectangle_color(x + 2, y + 7, x + ((sprite_width - 2) * compression), y + 8, c_white, c_white, c_silver, c_silver, false);
draw_rectangle_color(x + 1 + ((sprite_width - 3) * compression), y + 4, x + ((sprite_width - 3) * compression) + 2, y + 11, c_gray, c_gray, c_gray, c_gray, false);

draw_set_halign(fa_left);
draw_text(x + 2, y - 3, "Compression: " + string(round(compression * 100)) + "% (" + string(max(256 - (2 * (round(compression * 256) div 2)), 2)) + "px)");
