window_set_size(window_get_width() * 3, window_get_height() * 3);
alarm[0] = 1;

chameleon_init();

palX = 200;
palY = 48;

// List of loaded sprites
sprites = ds_list_create();

// List of loaded palettes - this USED TO correspond to the sprites list
palette = noone;

// AddSpriteButton click event.
add_sprite = function() {
	// Get file to load
	var file = get_open_filename("png file|*.png", "");
	
	// If the file exists...
	if (file != "") {
		try {
			// *try* to load it as a sprite and the associated Palette.
			ds_list_add(sprites, sprite_add(file, 0, false, false, 0, 0));
			if (palette == noone) palette = new TruePalette(palX, palY);
			palette.add_colors_from_sprite(sprites[| ds_list_size(sprites) - 1]);
		}
		catch (e) {
			// do nothing for now lol, just git gud
			show_debug_message("something went horribly wrong");
		}
	}
}

// LButton click event.
prev_sprite = function() {
	if (spriteIndex > 0) spriteIndex--;
}

// RButton click event.
next_sprite = function() {
	if (spriteIndex < ds_list_size(sprites) - 1) spriteIndex++;
}

// RemoveButton click event.
remove_sprite = function() {
	// If list has stuff in it...
	if (ds_list_size(sprites) > 0) {
		// Delete sprite, delete sprite entry in sprites, delete Palette entry in palettes
		sprite_delete(sprites[| spriteIndex]);
		ds_list_delete(sprites, spriteIndex);
		//ds_list_delete(palettes, spriteIndex);
	}
	// Safety clamp
	spriteIndex = clamp(spriteIndex, 0, max(0, ds_list_size(sprites) - 1));
}

// The currently selected sprite
spriteIndex = 0;