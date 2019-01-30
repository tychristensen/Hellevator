/// @description Insert description here
// You can write your code in this editor

vsp+=grav;
//regular collision check.
if (place_meeting(x,y+vsp,obj_floor))
{
    while(!place_meeting(x,y+sign(vsp),obj_floor))
    {
        y += sign(vsp);
    }
    vsp = 0;
}
//if the boulder isnt moving then increase the counter, if it stays still for too long then despawn it.
if(vsp == 0)
{
	still_counter++;
	if(still_counter > 120)
	{
		instance_destroy();
	}
}
y+=vsp;
