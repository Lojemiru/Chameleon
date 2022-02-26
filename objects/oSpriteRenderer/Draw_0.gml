

if (instance_exists(oPalBuilder) && ds_list_size(oPalBuilder.sprites) > 0) {
	chameleon_set_surface(oPalBuilder.palette.renderSurface);
	//chameleon_set(sLookUp2);
	draw_sprite_ext(oPalBuilder.sprites[| oPalBuilder.spriteIndex], 0, drawX, drawY, scale, scale, 0, -1, 1);
	shader_reset();
}

draw_self();