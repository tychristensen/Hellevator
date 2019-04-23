 /// @description Insert description here
// You can write your code in this editor
//Get the player's input
keyRight = keyboard_check(vk_right) or keyboard_check(ord("D"));
keyLeft = -(keyboard_check(vk_left) or keyboard_check(ord("A")));
keyJump = keyboard_check_pressed(vk_space);
keyEscape = keyboard_check_pressed(vk_escape);
if(global.hasGrappleHook) {
	fireGrapple = mouse_check_button_pressed(mb_left);
} else {
	fireGrapple = false;
}



switch(state)
{
	case(moveState.normal):
	{
		// Code in order to have sprite move in accordance to left or right key
		
		var move = keyRight + keyLeft; 
		if (move != 0) {
			image_xscale = -move;
		} 

		//adds acceleration due to gravity into vertical speed
		verticalSpeed += grav;

		//jump if jump key pressed
		if(keyJump && canJump)
		{
			verticalSpeed = -jumpSpeed;
			canJump = false;
		}
		
		if(keyboard_check_released(vk_space) && !canJump) {
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
		if(global.hasGrappleHook) {
			grappleAngAccel = -0.2 * dcos(ropeAngle);
		
			grappleAngAccel += keyRight * swingAccel;
			grappleAngAccel += keyLeft * swingAccel;
			ropeAngleVelocity += grappleAngAccel;
			ropeAngle += ropeAngleVelocity;
			ropeAngleVelocity *= .99;
		
			baseX = grappleX + lengthdir_x(ropeLength,ropeAngle);
			baseY = grappleY + lengthdir_y(ropeLength,ropeAngle);
		
			horizontalSpeed = round(baseX - x);
			verticalSpeed = baseY - y;
		
			if(keyJump)
			{
				instance_destroy(oGrappleHead);
				state = moveState.normal;
				verticalSpeed -= jumpSpeed;
				canJump = false;
			}
		}
	}break;
}

//horizontal collision

if (place_meeting(x+horizontalSpeed,y,oFloor)) {
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
}

//wall jump
if(global.hasWallJump && wallJump && (place_meeting(x+sprite_width/2+5,y,oWall)
						|| place_meeting(x-sprite_width/2-5,y,oWall))
						&& keyboard_check_pressed(vk_space))
{
	WALLJUMPCONST = 16;
	wallJump = false;
	verticalSpeed -= jumpSpeed * 0.65;
	if(place_meeting(x+abs(sprite_width/2)+5,y,oWall)) {
		horizontalSpeed = -horizontalAcceleration * WALLJUMPCONST;
	} else if(place_meeting(x-abs(sprite_width/2)-5,y,oWall)) {
		horizontalSpeed = horizontalAcceleration * WALLJUMPCONST;
	}
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
} else {
	canJump = false;
}

//updates x and y based on speed
y += verticalSpeed;
x += horizontalSpeed;

//if the player hits escape the game will end and close
if(keyEscape)
{
	game_end();
}