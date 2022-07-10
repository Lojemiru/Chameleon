
if (mouse_x <= bbox_right && mouse_x >= bbox_left && mouse_y >= bbox_top && mouse_y <= bbox_bottom && mouse_check_button_pressed(mb_left)) {
	if (!touched) {
		touched = true
		show_message("WARNING: Compression can have unintended consequences.\n\nPlease pay careful attention to your palette and only use powers of 2 unless you ABSOLUTELY know what you're doing.\n\nRuntime issues and color collisions should always be expected when compressing above 50%.")
	}
	moving = true;
}


if (moving) {
	compression = clamp((mouse_x - x) / sprite_width, 0, 1);
	
	moving = mouse_check_button(mb_left);
}
else {
	global.compression = max(256 - 2 * (round(compression * 256) div 2), 2);
} // 55 63
