var mx = mouse_x,
	my = mouse_y,
	sx = draw.sx,
	sy = draw.sy,
	bw = draw.bw,
	sw = draw.sw,
	sp = draw.sp,
	vi = point_in_rectangle(mx, my, sx, sy, sx + bw + sw + sp * 3, sy + bw + sp * 2);

if (mouse_check_button_pressed(mb_left)) {
	var cu = -1,
		y0 = sy + sp;
	if (vi && my > y0 && my < y0 + bw) {
		var x1 = sx + bw + sp;
		if (mx > sx + sp && mx < x1) cu = 0;
		else if (mx > x1 + sp && mx < x1 + sw + sp) cu = 1;
	}
	curt.fc = vi;
	curt.cu = cu;
}

if (!curt.fc) return;

if (mouse_check_button(mb_left)) {
	var cu = curt.cu;
	if (cu == 0) {
	    curt.sa = ceil(255 / bw * clamp(mx - sx - sp, 0, bw));
	    curt.va = 255 - ceil(255 / bw * clamp(my - sy - sp, 0, bw));
		return;
	}
	if (cu == 1) {
		curt.hu = ceil(255 / bw * clamp(my - sy - sp, 0, bw));
		draw.re = true;
		return;
	}
}
/*
var sc = keyboard_check(vk_right) - keyboard_check(vk_left);
if (sc != 0) curt.sa = clamp(curt.sa + sc * 2, 0, 255);

var vc = keyboard_check(vk_up) - keyboard_check(vk_down);
if (vc != 0) curt.va = clamp(curt.va + vc * 2, 0, 255);

var hc = keyboard_check(vk_add) - keyboard_check(vk_subtract);
if (hc != 0) {
	curt.hu = clamp(curt.hu + hc * 2, 0, 255);
	draw.re = true;
}
*/
