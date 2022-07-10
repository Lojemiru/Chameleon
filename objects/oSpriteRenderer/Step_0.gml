if (instance_exists(oPalBuilder) && ds_list_size(oPalBuilder.sprites) > 0) {

	if (mouse_x <= bbox_right && mouse_x >= bbox_left && mouse_y >= bbox_top && mouse_y <= bbox_bottom) {
		scale += (mouse_wheel_up() - mouse_wheel_down());
		scale = clamp(scale, 1, 10);

		if (mouse_check_button_pressed(mb_middle)) {
			drawX = 1;
			drawY = 1;
			scale = 1;
		}

		if (!moving && mouse_check_button_pressed(mb_left)) moving = true;
	}

	if (moving) {
		var w = sprite_get_width(oPalBuilder.sprites[| oPalBuilder.spriteIndex]),
			h = sprite_get_height(oPalBuilder.sprites[| oPalBuilder.spriteIndex]);
			
		drawX += (mouse_x - lastMouseX);
		drawY += (mouse_y - lastMouseY);
		
		
	
		moving = mouse_check_button(mb_left);
	}

	lastMouseX = mouse_x;
	lastMouseY = mouse_y;

}