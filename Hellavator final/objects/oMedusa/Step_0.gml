/// @description Handle Medusa projectile firing


if(attackTimer == 0) {
	attackTimer = attackCooldown;
	var p = instance_create_layer(x,y,"Instances",oMedProjectile);
	p.image_angle = point_direction(x,y,oPlayer.x,oPlayer.y);
} else {
	attackTimer--;
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