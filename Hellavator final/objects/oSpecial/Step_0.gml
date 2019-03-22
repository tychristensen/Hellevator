/// @description Insert description here
// You can write your code in this editor

//attack code. checks line of sight to player and moves to player if unobstructed
if(!collision_line(x,y,oPlayer.x,oPlayer.y,oFloor,false,true))
{
	attacking = true;
	lostPlayer = false
}
else
{
	if(!lostPlayer)
	{
		alarm[2] = followTime;
		lostPlayer = true;
	}
}
if(attacking)
{
	move_direction = sign(oPlayer.x-x);
	horizontalSpeed = maxHorizontalSpeed*move_direction;
}
/*else
{
	if(attacking = true)
	{
		attacking = false;
		horizontalSpeed = 0;
	}
	
}*/


//code below handles falling, collisions, and movement. It is magical.
//Horizontal Collision
if (place_meeting(x+horizontalSpeed,y,oFloor2))
{
    while(!place_meeting(x+sign(horizontalSpeed),y,oFloor2))
    {
        x += sign(horizontalSpeed);
    }
	horizontalSpeed = 0;
	verticalSpeed = -jumpSpeed;
}

if (verticalSpeed < 10) verticalSpeed += grav;
//vertical collision
if (place_meeting(x,y+verticalSpeed,oFloor2))
{
    while(!place_meeting(x,y+sign(verticalSpeed),oFloor2))
    {
        y += sign(verticalSpeed);
    }
    verticalSpeed = 0;
}
y += verticalSpeed;
x += horizontalSpeed;



