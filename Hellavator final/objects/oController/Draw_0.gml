if (room == Level0) {
		draw_set_halign(fa_center);
		var r = c_red; 
		draw_text_transformed_color(room_width/2, 200, "HELLAVATOR", 3, 3, 0, r, r, r, r, 1); 
		draw_text(room_width/2, 300, "Press Enter to Start the Game"); 
		draw_text(room_width/2, 350, "Press Escape at any point in the game to exit"); 
		draw_text(room_width/2, 400, "You have one life before being sent back to the start of your level, so make it count!");
} else if (room == LevelEnd) {
	draw_set_halign(fa_center);
	var r = c_red; 
	draw_text_transformed_color(room_width/2, 200, "THANKS FOR PLAYING!", 3, 3, 0, r, r, r, r, 1); 
	draw_text(room_width/2, 300, "Press Escape to end the game."); 
}