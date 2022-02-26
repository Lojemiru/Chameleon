/// @desc

// Click on buttons

var target = collision_point(mouse_x, mouse_y, oButton, true, true);
if (instance_exists(target)) {
	target.hover = true;

	if (mouse_check_button_pressed(mb_left)) {
		target.onClickEvent();
	}
}

if (palette != noone) {
	if (mouse_check_button_pressed(mb_left)) {
		palette.do_click(mouse_x, mouse_y);
	}
	else if (global.selectedElement != noone) {
		palette.update_click(mouse_x, mouse_y);
		if (mouse_check_button_released(mb_left)) {
			palette.release_click(mouse_x, mouse_y);
		}
	}
}

// Shift + key keybinds
if (keyboard_check(vk_shift)) {

}