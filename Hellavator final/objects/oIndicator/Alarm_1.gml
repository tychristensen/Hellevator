/// @description Insert description here
// You can write your code in this editor
meteor = instance_create_layer(oPlayer.x + choose(random(meteorSpawnRange), -random(meteorSpawnRange)),-32,"Instances",oBigMeteor);
with(meteor)
{
	attackAngle = point_direction(x,y,oIndicator.x,oIndicator.y);
}
instance_destroy();