scale += (mouse_wheel_up() - mouse_wheel_down()) / 2;
scale = clamp(scale, 0.5, 10);

if (keyboard_check(vk_space) && mouse_check_button(mb_left)) {
	drawX += (mouse_x - lastMouseX);
	drawY += (mouse_y - lastMouseY);
	drawX = clamp(drawX, bbox_left, bbox_right);
	drawY = clamp(drawY, bbox_top, bbox_bottom);
}

lastMouseX = mouse_x;
lastMouseY = mouse_y;