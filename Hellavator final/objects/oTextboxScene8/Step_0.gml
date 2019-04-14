/// @description Insert description here
// You can write your code in this editor

if(keyboard_check_pressed(ord("F"))) {
	if (page + 1 < array_length_1d(text)) {
		page += 1; 
		charCount = 0; 
		if ((page == 0) || (page == 1) || (page == 3) || (page == 4) || (page == 8)) {
			name = "Delilah";
		} else {
			name = "Hellavator";  
		}
	} else {
		instance_destroy(); 
		creator.alarm[1] = 1; 
		charCount = 0; 
	}
}