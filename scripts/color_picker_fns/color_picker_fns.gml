/// @param x
/// @param y
/// @param block_width
/// @param sidebar_width
/// @param space_width
/// @param background_color
function color_picker_create(x, y, b = 255, w = 32, s = 10, c = c_white) {
	
	var i = instance_create_depth(0, 0, depth - 1, color_picker);
	with (i) {
		draw.sx = x;
		draw.sy = y;
		draw.bw = b;
		draw.sw = w;
		draw.sp = s;
		draw.bc = c;
	}
	
	return i;

}

/// @param instance
/// @param color_value
function color_picker_set(i, c) {

	with (i) {
		curt.hu = color_get_hue(c);
		curt.sa = color_get_saturation(c);
		curt.va = color_get_value(c);
		draw.re = true;
	}

}

/// @param instance
function color_picker_get(i) {
	
	var r = 0;
	with (i) r = make_color_hsv(curt.hu, curt.sa, curt.va);
	return r;

}

/// @param color_value
function color_to_hex(c) {

	var n = (c & 16711680) >> 16 | (c & 65280) | (c & 255) << 16,
		s = "0123456789ABCDEF",
		r = "";

	repeat (3) {
		var b = n & 255;
		r = string_char_at(s, b div 16 + 1) + string_char_at(s, b % 16 + 1) + r;
		n = n >> 8;
	}

	return "#" + r;

}

/// @param hex_string
function hex_to_color(h) {
	
	var s = string_upper(string_lettersdigits(h)),
		s = string_copy(s, 1, 6),
		l = string_length(s);
		
	if (l == 3) {
		var c1 = string_char_at(s, 1),
			c2 = c1,
			c3 = string_char_at(s, 2),
			c4 = c3,
			c5 = string_char_at(s, 3),
			c6 = c5;
	} else {
		var c1 = string_char_at(s, 1),
			c2 = string_char_at(s, 2),
			c3 = string_char_at(s, 3),
			c4 = string_char_at(s, 4),
			c5 = string_char_at(s, 5),
			c6 = string_char_at(s, 6);
	}

	var r = char_to_num(c1) * 16 + char_to_num(c2),
		g = char_to_num(c3) * 16 + char_to_num(c4),
		b = char_to_num(c5) * 16 + char_to_num(c6);

	return make_color_rgb(r, g, b);

}

/// @param char
function char_to_num(c) {
	
	var r = string_digits(c);
	if (r != "") return real(r);
	
	switch (c) {
		case "A": r = 10; break;
		case "B": r = 11; break;
		case "C": r = 12; break;
		case "D": r = 13; break;
		case "E": r = 14; break;
		case "F": r = 15; break;
		default : r = 0;
	}

	return r;

}