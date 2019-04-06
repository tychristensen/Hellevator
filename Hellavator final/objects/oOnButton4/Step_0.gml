/// @description Checks if player is standing on button

var _inst = instance_place(x,y,oPlayer);

if (_inst != noone) {
	instance_activate_layer("Lvl4Hellavator");
	instance_deactivate_object(id);
}