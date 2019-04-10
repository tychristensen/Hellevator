/// @description Affected by gravity

if(destroyCounter == 0) {
	instance_destroy();
} else {
	destroyCounter--;
}
y += grav;