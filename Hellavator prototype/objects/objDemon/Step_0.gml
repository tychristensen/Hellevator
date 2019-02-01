/// @description Insert description here
// You can write your code in this editor

//attack code. checks line of sight to player and moves to player if unobstructed
if(!collision_line(x,y,objPlayer.x,objPlayer.y,objFloor,false,true))
{
	attacking = true;
	move_direction = sign(objPlayer.x-x);
	horizontalSpeed = maxHorizontalSpeed*move_direction;
}
else
{
	if(attacking = true)
	{
		attacking = false;
		horizontalSpeed = 0;
	}
	
}
//code below handles falling, collisions, and movement. It is magical.
//Horizontal Collision
if (place_meeting(x+horizontalSpeed,y,objFloor))
{
    while(!place_meeting(x+sign(horizontalSpeed),y,objFloor))
    {
        x += sign(horizontalSpeed);
    }
	horizontalSpeed = 0;
}

if (verticleSpeed < 10) verticleSpeed += grav;
//vertical collision
if (place_meeting(x,y+verticleSpeed,objFloor))
{
    while(!place_meeting(x,y+sign(verticleSpeed),objFloor))
    {
        y += sign(verticleSpeed);
    }
    verticleSpeed = 0;
}
y += verticleSpeed;
x += horizontalSpeed;



