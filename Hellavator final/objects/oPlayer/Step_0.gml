 /// @description Insert description here
// You can write your code in this editor
//Get the player's input
keyRight = keyboard_check(vk_right);
keyLeft = -keyboard_check(vk_left);
keyJump = keyboard_check_pressed(vk_space);
keyEscape = keyboard_check_pressed(vk_escape);

//adds acceleration due to gravity into vertical speed
verticalSpeed += grav;

//jump if jump key pressed
if(keyJump && canJump == true)
{
	verticalSpeed = -jumpSpeed;
	canJump = false;
}

//limits horizontal speed
if(horizontalSpeed<maxHorizontalSpeed)
{
	horizontalSpeed += keyRight*horizontalAcceleration;
}
if(horizontalSpeed>-maxHorizontalSpeed)
{
	horizontalSpeed += keyLeft*horizontalAcceleration;
}

//slowly decellerates player horizontally
if(horizontalSpeed>0 && !keyLeft && !keyRight)
{
	horizontalSpeed-=slow;
}
if(horizontalSpeed<0 && !keyLeft && !keyRight)
{
	horizontalSpeed+=slow;
}

//Horizontal Collision
if (place_meeting(x+horizontalSpeed,y,oFloor))
{
    while(!place_meeting(x+sign(horizontalSpeed),y,oFloor))
    {
        x += sign(horizontalSpeed);
    }
	horizontalSpeed = 0;
}

//vertical collision
if (place_meeting(x,y+verticalSpeed,oFloor))
{
    while(!place_meeting(x,y+sign(verticalSpeed),oFloor))
    {
        y += sign(verticalSpeed);
    }
	
	// only resets jump if touched a platform below, not above
	if(verticalSpeed>0)
	{
		canJump = true;
	}
	//if the vertical speed it large enough then landing will cause a minor screen shake
	if(verticalSpeed > impactConstant)
	{
		global.shake = 2;
		oCamera.alarm[0] = 8;
	}
    verticalSpeed = 0;	
}

//updates x and y based on speed
y += verticalSpeed;
x += horizontalSpeed;

//if the player hits escape the game will end and close
if(keyEscape)
{
	game_end();
}