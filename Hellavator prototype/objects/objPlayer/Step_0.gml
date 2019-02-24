//Get the player's input
keyRight = keyboard_check(vk_right);
keyLeft = -keyboard_check(vk_left);
keyJump = keyboard_check_pressed(vk_space);
keyDown = keyboard_check_pressed(vk_down);

//dictates jumping
if(keyJump && canJump == true)
{
	verticleSpeed = -jumpSpeed;
	canJump = false;
}

if(horizontalSpeed<maxHorizontalSpeed)
{
	horizontalSpeed += keyRight*horizontalAcceleration;
}
if(horizontalSpeed>-maxHorizontalSpeed)
{
	horizontalSpeed += keyLeft*horizontalAcceleration;
}

//slowdown code
if(horizontalSpeed>0 && !keyLeft && !keyRight)
{
	horizontalSpeed-=slow;
}
if(horizontalSpeed<0 && !keyLeft && !keyRight)
{
	horizontalSpeed+=slow;
}



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


//makes it so if you touch an idle boulder tile it deletes the floor which will spawn a falling boulder
if(place_meeting(x,y+verticleSpeed,objBoulderIdle))
{
	if(keyDown)
	{
		instance_destroy(instance_place(x,y+verticleSpeed,objBoulderIdle),true);
	}	
}
//vertical collision
if (place_meeting(x,y+verticleSpeed,objFloor))
{
    while(!place_meeting(x,y+sign(verticleSpeed),objFloor))
    {
        y += sign(verticleSpeed);
    }
    verticleSpeed = 0;
	canJump = true;

}

//corner bug test
if (place_meeting(x+horizontalSpeed,y+verticleSpeed,objFloor))
{
    while(!place_meeting(x+sign(horizontalSpeed),y+sign(verticleSpeed),objFloor))
    {
        x += sign(horizontalSpeed);
		y += sign(verticleSpeed);
    }
	horizontalSpeed = 0;
	verticleSpeed = 0;
}


y += verticleSpeed;
x += horizontalSpeed;