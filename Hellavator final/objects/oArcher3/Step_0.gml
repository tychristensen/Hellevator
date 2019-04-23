/// @description Insert description here
// You can write your code in this editor

//attack code. checks line of sight to player and moves to player if unobstructed
if(!collision_line(x,y,oPlayer.x,oPlayer.y,oFloor,false,true) and
		!collision_line(x,y,oPlayer.x,oPlayer.y,oGravestone,false,true))
{
	if(attackTimer == 0) {
		attackTimer = attackCooldown;
		var p = instance_create_layer(x,y,"Instances",oArrow);
		p.image_angle = point_direction(x,y,oPlayer.x,oPlayer.y);
	} else {
		attackTimer--;
	}
}