//Get the player's input
key_right = keyboard_check(vk_right);
key_left = -keyboard_check(vk_left);
key_jump = keyboard_check_pressed(vk_space);
key_down = keyboard_check_pressed(vk_down);

//dictates jumping
if(key_jump && can_jump == true)
{
	vsp = -jump_speed;
	can_jump = false;
}

if(hsp<max_hsp)
{
	hsp += key_right*h_accel;
}
if(hsp>-max_hsp)
{
	hsp += key_left*h_accel;
}

//slowdown code
if(hsp>0 && !key_left && !key_right)
{
	hsp-=slow;
}
if(hsp<0 && !key_left && !key_right)
{
	hsp+=slow;
}



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


//makes it so if you touch an idle boulder tile it deletes the floor which will spawn a falling boulder
if(place_meeting(x,y+vsp,obj_boulder_idle))
{
	if(key_down)
	{
		instance_destroy(instance_place(x,y+vsp,obj_boulder_idle),true);
	}	
}
//vertical collision
if (place_meeting(x,y+vsp,obj_floor))
{
    while(!place_meeting(x,y+sign(vsp),obj_floor))
    {
        y += sign(vsp);
    }
    vsp = 0;
	can_jump = true;

}

y += vsp;
x += hsp