with (other) {
	instance_destroy(); 
	
	if (sprite_index == sMeteor) {
		repeat(2) {
			var new_meteor = instance_create_layer(x,y,"Instances",oSmallMeteor);
			new_meteor.sprite_index = sMiniteor
		}
	}
}