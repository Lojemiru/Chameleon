
draw_rectangle_color(x, y, x + 255, y + 7, c_grey, c_grey, c_grey, c_grey, true);
draw_rectangle_color(x, y, x + 255, y + 7, c_black, col, col, c_black, false);
draw_line_color(x + val, y - 1, x + val, y + y, c_white, c_white);
draw_text(x + 255 + 5, y, string(val));