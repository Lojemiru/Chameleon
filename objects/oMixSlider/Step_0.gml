
if (mouse_x <= bbox_right && mouse_x >= bbox_left && mouse_y >= bbox_top && mouse_y <= bbox_bottom && mouse_check_button_pressed(mb_left)) {
	moving = true;
	
}


if (moving) {
	global.mix = clamp((mouse_x + 0.5 - x) / sprite_width, 0, 1);
	
	moving = mouse_check_button(mb_left);
}
