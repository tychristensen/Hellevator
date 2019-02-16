/// @description Insert description here
// You can write your code in this editor

verticleSpeed+=grav;
//regular collision check.
if (place_meeting(x,y+verticleSpeed,objFloor))
{
    while(!place_meeting(x,y+sign(verticleSpeed),objFloor))
    {
        y += sign(verticleSpeed);
    }
    verticleSpeed = 0;
}
//if the boulder isnt moving then increase the counter, if it stays still for too long then despawn it.
if(verticleSpeed == 0)
{
	still_counter++;
	if(still_counter > 120)
	{
		instance_destroy();
	}
}
y+=verticleSpeed;
