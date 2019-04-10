if (room == Level0) {
	if (keyboard_check_pressed(vk_enter)) {
		room_goto(Level1);
	} 
} else {
	if (keyboard_check_pressed(vk_escape)) {
		game_end();
	}
}