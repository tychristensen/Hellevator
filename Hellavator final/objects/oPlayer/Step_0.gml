 /// @description Insert description here
// You can write your code in this editor
//Get the player's input
keyRight = keyboard_check(vk_right) or keyboard_check(ord("D"));
keyLeft = -(keyboard_check(vk_left) or keyboard_check(ord("A")));
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
		
		if(keyboard_check_released(vk_space) and !canJump)
		{
			wallJump = true;
		}

		//fires grapple projectile
		if(fireGrapple)
		{
			instance_create_layer(x,y,"Instances",oGrappleProjectile)
			//instance_create_layer(mouse_x,mouse_y,"Instances",oGrappleHead) this puts grapple head at mouse
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
			
			velocityMagnitude = sqrt(horizontalSpeed*horizontalSpeed + verticalSpeed*verticalSpeed);
			theta = point_direction(grappleX,grappleY,x,y)
			phi = degtorad(arctan(horizontalSpeed/verticalSpeed))
			delta = theta-phi;
			ropeAngleVelocity = velocityMagnitude*cos(delta)*.05;
			
			//ropeAngleVelocity = 0;
			ropeAngle = point_direction(grappleX,grappleY,x,y);
			ropeLength = point_distance(grappleX,grappleY,x,y);
			state = moveState.grappling
		}
	}break;
	
	case(moveState.grappling):
	{
		grappleAngAccel = -0.2 * dcos(ropeAngle);
		
		grappleAngAccel += keyRight * swingAccel;
		grappleAngAccel += keyLeft * swingAccel;
		ropeAngleVelocity += grappleAngAccel;
		ropeAngle += ropeAngleVelocity;
		ropeAngleVelocity *= .99;
		
		baseX = grappleX + lengthdir_x(ropeLength,ropeAngle);
		baseY = grappleY + lengthdir_y(ropeLength,ropeAngle);
		
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

if (place_meeting(x+horizontalSpeed,y,oWall))
{
	while(!place_meeting(x+sign(horizontalSpeed),y,oWall))
    {
        x += sign(horizontalSpeed);
    }
	if(state == moveState.grappling)
	{
		horizontalSpeed = 0;
		ropeAngle = point_direction(grappleX,grappleY,x,y);
		ropeAngleVelocity = 0;
	}
	else if(keyboard_check(vk_space) and wallJump)
	{
		WALLJUMPCONST = 16;
		wallJump = false;
		verticalSpeed -= jumpSpeed * 0.5;
		if(keyRight != 0) {
			horizontalSpeed = -horizontalAcceleration * WALLJUMPCONST;
		} else if(keyLeft != 0) {
			horizontalSpeed = horizontalAcceleration * WALLJUMPCONST;
		}
	}
	else
	{
		verticalSpeed -= abs(horizontalSpeed) * 0.1;
		horizontalSpeed = 0;
	}
} else if (place_meeting(x+horizontalSpeed,y,oFloor)) {
    while(!place_meeting(x+sign(horizontalSpeed),y,oFloor))
    {
        x += sign(horizontalSpeed);
    }
	horizontalSpeed = 0;
	if(state == moveState.grappling)
	{
		ropeAngle = point_direction(grappleX,grappleY,x,y);
		ropeAngleVelocity = 0;
	}
} else if (!(place_meeting(x+horizontalSpeed,y,oWall))) {
	wallJump = false;
}

//vertical collision
if (place_meeting(x,y+verticalSpeed,oFloor))
{
	wallJump = false;
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
		if(state = moveState.grappling)
	{
		ropeAngle = point_direction(grappleX,grappleY,x,y);
		ropeAngleVelocity = 0;
	}
}
else if (place_meeting(x,y+verticalSpeed,oWall))
{
	wallJump = false;
    while(!place_meeting(x,y+sign(verticalSpeed),oWall))
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
		if(state = moveState.grappling)
	{
		ropeAngle = point_direction(grappleX,grappleY,x,y);
		ropeAngleVelocity = 0;
	}
}

//updates x and y based on speed
y += verticalSpeed;
x += horizontalSpeed;
MoveObj();

//if the player hits escape the game will end and close
if(keyEscape)
{
	game_end();
}