if (instance_exists(oPalBuilder) && ds_list_size(oPalBuilder.sprites) > 0) {

	scale += (mouse_wheel_up() - mouse_wheel_down()) / 2;
	scale = clamp(scale, 0.5, 10);

	if (!moving && mouse_x <= bbox_right && mouse_x >= bbox_left && mouse_y >= bbox_top && mouse_y <= bbox_bottom && keyboard_check(vk_space) && mouse_check_button_pressed(mb_left)) moving = true;

	if (moving) {
		var w = sprite_get_width(oPalBuilder.sprites[| oPalBuilder.spriteIndex]),
			h = sprite_get_height(oPalBuilder.sprites[| oPalBuilder.spriteIndex]);
			
		drawX += (mouse_x - lastMouseX);
		drawY += (mouse_y - lastMouseY);
		
		if (mouse_check_button_pressed(mb_middle)) {
			drawX = 0;
			drawY = 0;
		}
	
		moving = keyboard_check(vk_space) && mouse_check_button(mb_left);
	}

	lastMouseX = mouse_x;
	lastMouseY = mouse_y;

}