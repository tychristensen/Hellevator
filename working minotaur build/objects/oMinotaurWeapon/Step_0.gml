/// @description Insert description here
// You can write your code in this editor
ang = point_direction(x,y,oPlayer.x,oPlayer.y);
image_angle = ang;

horizontalSpeed = velocity*dcos(ang);
verticalSpeed = -velocity*dsin(ang);

x += horizontalSpeed;
y += verticalSpeed;

if(!instance_exists(oBossMinotaur)){
	instance_destroy();
}