/// @description Insert description here
// You can write your code in this editor
grappleSpeed = 16;
shotDirection = point_direction(x,y,mouse_x,mouse_y);
hsp = grappleSpeed*dcos(shotDirection);
vsp = -grappleSpeed*dsin(shotDirection);