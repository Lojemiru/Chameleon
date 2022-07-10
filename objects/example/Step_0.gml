var cp = curt.cp;
var create_cp = function(cp) {
	if (cp) {
		instance_destroy(cp);
		curt.cp = false;
	} else {
		var cx = draw.sx + 96,
			cy = draw.ey + 16;
		curt.cp = color_picker_create(cx, cy, 175 * 2, 25, 8, c_white);
		color_picker_set(curt.cp, curt.co);
	}
}

if (cp) curt.co = color_picker_get(cp);

if (keyboard_check_pressed(vk_enter)) {
	create_cp(cp);
	return;
}

if (mouse_check_button_pressed(mb_left)) {
	var ex = draw.ex;
	if (point_in_rectangle(mouse_x, mouse_y, ex - 38, draw.sy, ex, draw.ey)) create_cp(cp);
}