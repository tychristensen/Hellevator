 /// @description Insert description here
// You can write your code in this editor
//Get the player's input
keyRight = keyboard_check(vk_right);
keyLeft = -keyboard_check(vk_left);
keyJump = keyboard_check_pressed(vk_space);
keyEscape = keyboard_check_pressed(vk_escape);
fireGrapple = mouse_check_button_pressed(mb_left);


switch(state)
{
	case(moveState.normal):
	{
		//adds acceleration due to gravity into vertical speed
		verticalSpeed += grav;

		//jump if jump key pressed
		if(keyJump && canJump)
		{
			verticalSpeed = -jumpSpeed;
			canJump = false;
		}

		//fires grapple projectile
		if(fireGrapple)
		{
			//instance_create_layer(x,y,"Instances",oGrappleProjectile)
			instance_create_layer(mouse_x,mouse_y,"Instances",oGrappleHead)
		}

		//limits horizontal speed
		if(horizontalSpeed < maxHorizontalSpeed)
		{
			horizontalSpeed += keyRight*horizontalAcceleration;
		}
		if(horizontalSpeed > -maxHorizontalSpeed)
		{
			horizontalSpeed += keyLeft*horizontalAcceleration;
		}

		//slowly decelerates player horizontally
		if(horizontalSpeed>0 && !keyLeft && !keyRight)
		{
			horizontalSpeed-=slow;
		}
		if(horizontalSpeed<0 && !keyLeft && !keyRight)
		{
			horizontalSpeed+=slow;
		}
		if(instance_exists(oGrappleHead))
		{
			grappleX = oGrappleHead.x;
			grappleY = oGrappleHead.y;
			baseX = x;
			baseY = y;
			ropeAngleVelocity = 0;
			ropeAngle = point_direction(grappleX,grappleY,x,y);
			ropeLength = point_distance(grappleX,grappleY,x,y);
			state = moveState.grappling
		}
	}break;
	
	case(moveState.grappling):
	{
		grappleAngAccel = -0.2 * dcos(ropeAngle);
		ropeAngleVelocity += grappleAngAccel;
		ropeAngle += ropeAngleVelocity;
		ropeAngleVelocity *= .99;
		
		baseX = lengthdir_x(ropeLength,ropeAngle);
		baseY = lengthdir_y(ropeLength,ropeAngle);
		
		horizontalSpeed = baseX - x;
		verticalSpeed = baseY - y;
		
		if(keyJump)
		{
			instance_destroy(oGrappleHead);
			state = moveState.normal;
			verticalSpeed -= jumpSpeed;
			canJump = false;
		}
	}break;
}

//horizontal collision
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
		global.shake = 1;
		oCamera.alarm[0] = 8;
	}
    verticalSpeed = 0;	
}

//horizontal collision
if (place_meeting(x+horizontalSpeed,y,oFloor2))
{
    while(!place_meeting(x+sign(horizontalSpeed),y,oFloor2))
    {
        x += sign(horizontalSpeed);
    }
	horizontalSpeed = 0;
}

//vertical collision
if (place_meeting(x,y+verticalSpeed,oFloor2))
{
    while(!place_meeting(x,y+sign(verticalSpeed),oFloor2))
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
		global.shake = 1;
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