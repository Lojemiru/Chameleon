var s1 = draw.s1,
	s2 = draw.s2,
	sx = draw.sx,
	sy = draw.sy,
	bw = draw.bw,
	sw = draw.sw,
	sp = draw.sp,
	sc = bw / 255;
	
#region draw background
	
	var ex = sx + bw + sw + sp * 3;
	draw_set_color(draw.bc);
	draw_roundrect_ext(sx, sy, ex, sy + bw + sp * 2, 12, 12, false);
	draw_triangle(ex - 27, sy, ex - 20, sy - 8, ex - 13, sy, false);
	
	sx += sp;
	sy += sp;

#endregion
	
#region draw surface 1
	
	if (!surface_exists(s1)) {
		s1 = surface_create(bw, bw);
		draw.s1 = s1;
		draw.re = true;
	}

	if (draw.re) {

		surface_set_target(s1);
		draw_clear_alpha(0, 0);
	
		draw_set_color(make_color_hsv(curt.hu, 255, 255));
	    draw_rectangle(0, 0, bw, bw, false);

		surface_reset_target();
		draw.re = false;
	
	}

	shader_set(color_picker_sha);
	draw_surface(s1, sx, sy);
	shader_reset();
	
	var dx = sx + ceil(sc * curt.sa),
		dy = sy + bw - ceil(sc * curt.va);
	
	draw_set_circle_precision(64);
	draw_set_color(c_black);
	draw_circle(dx, dy, 4, true);
	draw_set_color(c_white);
	draw_circle(dx, dy, 5, true);

#endregion

#region draw surface 2
	
	if (!surface_exists(s2)) {
		
		s2 = surface_create(sw, bw);
		surface_set_target(s2);
		draw_clear_alpha(0, 0);
		
		var i = 0,
			l = bw;

		repeat (l) {
			var co = make_color_hsv(255 / bw * i, 255, 255);
	        draw_set_color(co);
	        draw_line(0, i, sw, i);
			i ++;
		}
	
		surface_reset_target();
		draw.s2 = s2;
		draw.re = true;
		
	}
	
	sx += bw + sp;
	draw_surface(s2, sx, sy);
	
	sy += clamp(ceil(sc * curt.hu), 0, bw - 5);
	draw_set_color(c_black);
	draw_rectangle(sx + 2, sy, sx + sw - 2, sy + 4, true);
	draw_set_color(c_white);
	draw_rectangle(sx + 1, sy - 1, sx + sw - 1, sy + 5, true);

#endregion