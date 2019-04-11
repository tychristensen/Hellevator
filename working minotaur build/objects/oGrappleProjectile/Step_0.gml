/// @description Insert description here
// You can write your code in this editor

//horizontal collision
if (place_meeting(x+hsp,y,oFloor))
{
    while(!place_meeting(x+sign(hsp),y,oFloor))
    {
        x += sign(hsp);
    }
	instance_create_layer(x,y,"Instances",oGrappleHead)
	instance_destroy();
}

//vertical collision
if (place_meeting(x,y+vsp,oFloor))
{
    while(!place_meeting(x,y+sign(vsp),oFloor))
    {
        y += sign(vsp);
    }
	instance_create_layer(x,y,"Instances",oGrappleHead)
	instance_destroy();
}

x += hsp
y += vsp