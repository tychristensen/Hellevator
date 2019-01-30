/// @description Insert description here
// You can write your code in this editor

//attack code. checks line of sight to player and moves to player if unobstructed
if(!collision_line(x,y,obj_player.x,obj_player.y,obj_floor,false,true))
{
	attacking = true;
	move_direction = sign(obj_player.x-x);
	hsp = max_hsp*move_direction;
}
else
{
	if(attacking = true)
	{
		attacking = false;
		hsp = 0;
	}
	
}
//code below handles falling, collisions, and movement. It is magical.
//Horizontal Collision
if (place_meeting(x+hsp,y,obj_floor))
{
    while(!place_meeting(x+sign(hsp),y,obj_floor))
    {
        x += sign(hsp);
    }
	hsp = 0;
}

if (vsp < 10) vsp += grav;
//vertical collision
if (place_meeting(x,y+vsp,obj_floor))
{
    while(!place_meeting(x,y+sign(vsp),obj_floor))
    {
        y += sign(vsp);
    }
    vsp = 0;
}
y += vsp;
x += hsp;



