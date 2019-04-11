/// @description Checks if player is standing on button

var _inst = instance_place(x,y,oPlayer);

if (_inst != noone) {
	instance_activate_layer("firstWind");
	instance_deactivate_layer("secondWind")
	instance_deactivate_object(id);
	instance_activate_object(oOffButton);
}