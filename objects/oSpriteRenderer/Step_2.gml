if (!surface_exists(mysurf)) {
	mysurf = surface_create(bbox_right - bbox_left, bbox_bottom - bbox_top);
}

surface_set_target(mysurf);

draw_clear_alpha(c_black, 0);

if (instance_exists(oPalBuilder) && ds_list_size(oPalBuilder.sprites) > 0) {
	chameleon_set_surface(oPalBuilder.palette.renderSurface, global.mix);
	//chameleon_set(sLookUp2);
	draw_sprite_ext(oPalBuilder.sprites[| oPalBuilder.spriteIndex], 0, drawX, drawY, scale, scale, 0, -1, 1);
	shader_reset();
}

surface_reset_target();