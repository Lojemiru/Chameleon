window_set_size(window_get_width() * 3, window_get_height() * 3);
alarm[0] = 1;

chameleon_init();

palX = 297;
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
			show_message("something went horribly wrong");
			throw e;
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

export_pal = function() {
	var fname = get_save_filename("png file|*.png", "");
	if (fname != "" && surface_exists(palette.renderSurface)) {
		surface_save(palette.renderSurface, fname);
		show_message("Palette sprite exported.");
	}
	else {
		// do nothing for now lol, just git gud
		show_message("Something went wrong trying to export. You either didn't supply a name or there is no palette to export!");
	}
}

save_pal = function() {
	if (palette == noone) return;
	var fname = get_save_filename("json file|*.json", "");
	if (fname != "" && palette != noone) {
		var export = json_stringify({ colors : palette.colors, oldColors : palette.oldColors });
		var file = file_text_open_write(fname);
		file_text_write_string(file, export);
		file_text_close(file);
		show_message("Palette JSON saved.");
	}
	else {
		show_message("Something went wrong trying to save. You either didn't supply a name or there is no palette to save!");
	}
}

load_pal = function() {
	
	if (palette != noone) if (!show_question("WARNING: Loading a palette will wipe all unsaved work! Do you wish to proceed?")) return;
	
	var fname = get_open_filename("json file|*.json", "");
	if (fname != "") {
		var file = file_text_open_read(fname);
		var json = json_parse(file_text_read_string(file));
		file_text_close(file);
		if (is_struct(json)) {
			if ((json.colors != undefined) && (json.oldColors != undefined)) {
				if (palette == noone) palette = new TruePalette(palX, palY);
				var i = 0;
				repeat (array_length(json.colors)) {
					palette.colors[i] = new Color(json.colors[i].r, json.colors[i].g, json.colors[i].b);
					palette.oldColors[i] = new Color(json.oldColors[i].r, json.oldColors[i].g, json.oldColors[i].b);
					++i;
				}
				palette.h = i * 8;
				color_picker_set(palette.picker, palette.colors[palette.selected].rgb);
				sprites = ds_list_create();
				spriteIndex = 0;
				
				palette.rerender_surface();
			}
		}
	}
	else {
		show_message("Something went wrong trying to load. File was not found or is invalid.");
	}
}
