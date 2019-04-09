/// @description Insert description here
// You can write your code in this editor

if(keyboard_check_pressed(ord("F"))) {
	if (page + 1 < array_length_1d(text)) {
		page += 1; 
		charCount = 0; 
	} else {
		instance_destroy(); 
		//creator.alarm[1] = 1; 
		charCount = 0; 
	}
}