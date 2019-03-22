/*with (other) {
	instance_destroy(); 
	
	if (sprite_index == sMeteor) {
		repeat(2) {
			var new_meteor = instance_create_layer(x,y,"Instances",oSmallMeteor);
			new_meteor.sprite_index = sMiniteor
		}
	}
}
*/
repeat(3)
{
			var new_meteor = instance_create_layer(x,y,"Instances",oSmallMeteor);
			new_meteor.sprite_index = sMiniteor
}
destroyChance = irandom(3)
if(destroyChance = 0)
{
	instance_destroy(other);
}
else
{
	instance_create_depth(other.x+(other.sprite_width/2),other.y,other.depth-1, oIceFire)
}
instance_destroy();