/// @desc Set delayed info

window_center();

oAddSpriteButton.set_event(add_sprite);
oAddSpriteButton.label = "Add sprite";

oLButton.label = "Prev";
oLButton.set_event(prev_sprite);
oRButton.label = "Next";
oRButton.set_event(next_sprite);

oRemoveButton.label = "Remove";
oRemoveButton.set_event(remove_sprite);

oExportButton.label = "Export";
oExportButton.set_event(export_pal);

oSaveButton.label = "Save";
oSaveButton.set_event(save_pal);

oLoadButton.label = "Load";
oLoadButton.set_event(load_pal);
