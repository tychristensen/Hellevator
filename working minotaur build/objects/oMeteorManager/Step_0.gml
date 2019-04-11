/// @description Insert description here
// You can write your code in this editor

if(!instance_exists(oIndicator) && makeNewMeteorCycle)
{
	makeNewMeteorCycle = false;
	newMeteor = instance_create_layer(x,y,"Instances",oIndicator)
	with(newMeteor)
	{
		oIndicator.alarm[0] = 60;
	}
}