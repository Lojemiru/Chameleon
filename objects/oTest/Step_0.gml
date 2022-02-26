/// @description Insert description here
// You can write your code in this editor

var input = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);

if (input != 0) {
	pal += input;
	pal = clamp(pal, 1, 16);
}