/// @description Insert description here
// You can write your code in this editor

//attack code. checks line of sight to player and moves to player if unobstructed
if(!collision_line(x,y,oPlayer.x,oPlayer.y,oFloor,false,true))
{
	if(attackTimer == 0) {
		attackTimer = attackCooldown;
		var p = instance_create_layer(x,y,"Instances",oProjectile);
		p.image_angle = point_direction(x,y,oPlayer.x,oPlayer.y);
	} else {
		attackTimer--;
	}
}


/*
//code below handles falling, collisions, and movement. It is magical.
//Horizontal Collision
if (place_meeting(x+horizontalSpeed,y,oFloor))
{
    while(!place_meeting(x+sign(horizontalSpeed),y,oFloor))
    {
        x += sign(horizontalSpeed);
    }
	horizontalSpeed = 0;
}

if (verticalSpeed < 10) verticalSpeed += grav;
//vertical collision
if (place_meeting(x,y+verticalSpeed,oFloor))
{
    while(!place_meeting(x,y+sign(verticalSpeed),oFloor))
    {
        y += sign(verticalSpeed);
    }
    verticalSpeed = 0;
}
*/



