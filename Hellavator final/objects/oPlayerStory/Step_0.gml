/// @description Insert description here
// You can write your code in this editor

if(instance_exists(oScene13Trigger)){
	if (global.trigger == 1) {
		sprite_index = sHellevator; 
		instance_create_layer(oPlayerStory.x,oPlayerStory.y,"Instances",oHellevator);
	}
}
