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
	palette.step();
	var mw = mouse_wheel_down() - mouse_wheel_up();
	
	if (mw != 0) {
		palette.do_mwheel(mw, mouse_x, mouse_y);
		
	}
	
	if (mouse_check_button_pressed(mb_left)) {
		palette.do_click(mouse_x, mouse_y);
	}
	else if (global.selectedElement != noone) {
		palette.update_click(mouse_x, mouse_y);
		if (mouse_check_button_released(mb_left)) {
			palette.release_click(mouse_x, mouse_y);
		}
	}
	
	if (mouse_check_button_pressed(mb_middle)) {
		palette.do_middle_click(mouse_x, mouse_y);
	}
	
	if (keyboard_check_pressed(vk_left)) prev_sprite();
	else if (keyboard_check_pressed(vk_right)) next_sprite();
}

// Shift + key keybinds
if (keyboard_check(vk_shift)) {

}