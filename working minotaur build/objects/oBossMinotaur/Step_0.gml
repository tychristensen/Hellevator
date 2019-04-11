/// @description Insert description here
// You can write your code in this editor
horizontalSpeed = 0;
switch(curState) {
	case(bossState.moving): {
		if (oPlayer.x < x){
			horizontalSpeed = -movespeed;
		}
		
		if(oPlayer.x > x ){
			horizontalSpeed = movespeed;
		}
		if(abs(oPlayer.x - x) < 10){
			horizontalSpeed = 0;
			curState = bossState.stopped;
		}
		if(!instance_exists(oMinotaurWeapon)){
			instance_create_layer(x,y,"Instances",oMinotaurWeapon)
			invincibility = 1;
			alarm[2] = 90;
			curState = bossState.stopped;
			//curState = bossState.attacking;
		}
	};
	
	case(bossState.stopped):{
		if(stopped = 0){
			alarm[0] = 60;
			stopped = 1;
		}
	};
	
	/*case(bossState.attacking):{
		horizontalSpeed = 0;
		if(attackDelay = 0) {
			attackDelay = 1;
			alarm[1] = 30;
		}
		
	};*/
}

if(curHealth < 1){
	instance_destroy();
}

if (place_meeting(x+horizontalSpeed,y,oFloor))
{
    while(!place_meeting(x+sign(horizontalSpeed),y,oFloor))
    {
        x += sign(horizontalSpeed);
    }
	horizontalSpeed = 0;
}

if (verticalSpeed < 10) verticalSpeed += grav;
//vertical collision
if (place_meeting(x,y+verticalSpeed,oFloor))
{
    while(!place_meeting(x,y+sign(verticalSpeed),oFloor))
    {
        y += sign(verticalSpeed);
    }
    verticalSpeed = 0;
}
y += verticalSpeed;
x += horizontalSpeed;
