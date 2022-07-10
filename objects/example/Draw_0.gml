
var sx = draw.sx,
	sy = draw.sy,
	ex = draw.ex,
	ey = draw.ey;
	
#region draw background

	draw_set_color(draw.c0);
	draw_set_circle_precision(64);
	draw_roundrect_ext(sx, sy, ex, ey, 4, 4, true);

#endregion

#region draw block & string
	
	var co = curt.co,
		cs = color_to_hex(co);
		
	draw_set_color(co);
	draw_rectangle(sx + 7, sy + 7, sx + 31, sy + 31, false);
	
	draw_set_color(draw.c0);
	draw_rectangle(sx + 7, sy + 7, sx + 31, sy + 31, true);
	
	draw_set_color(draw.c1);
	draw_set_valign(fa_middle);
	draw_text(sx + 42, sy + 19, cs);
	
	draw_line(ex - 27, sy + 16, ex - 20, sy + 23);
	draw_line(ex - 13, sy + 16, ex - 20, sy + 23);

#endregion

var tp = "1.Click the arrow with the mouse or press the [Enter] key to [open/close] the color picker.\n2.When the color picker is open, you can pick the color by dragging with the mouse, or adjust the saturation and brightness by the [direction keys], and adjust the hue by the [plus and minus keys].";
draw_text_ext(140, 600, tp, 20, 1000);