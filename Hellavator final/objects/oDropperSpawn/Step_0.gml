/// @description Spawn droppers

if(dropperTimer == 0) {
	instance_create_layer(x,y,"Instances",oDropper);
	dropperTimer = dropperCooldown;
} else {
	dropperTimer--;
}