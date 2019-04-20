if (room == Level0) {
	if (keyboard_check_pressed(vk_enter)) {
		room_goto_next();
	} 
} else {
	if (keyboard_check_pressed(vk_escape)) {
		game_end();
	}
}

/*
if (global.isDead == 1) {
	instance_create_layer(oPlayer.x,oPlayer.y,"Instances",oScene14Trigger); 
	instance_create_layer(oPlayer.x + 50, oPlayer.y, "Instances", oVoidPortal); 
}*/