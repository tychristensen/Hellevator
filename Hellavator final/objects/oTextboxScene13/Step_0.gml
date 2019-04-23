/// @description Insert description here
// You can write your code in this editor

if(keyboard_check_pressed(ord("F"))) {
	if (page + 1 < array_length_1d(text)) {
		page += 1; 
		charCount = 0; 
		if ((page == 1) || (page == 3) || (page == 4) || (page == 12) || (page == 13) || (page == 14) || (page ==15) || (page == 16)) {
			name = "Delilah";
		} else if (page == 20) {
			name = "Hellavator";
			global.trigger = 1; 
		} else {
			name = "Past Delilah";  
		}
	} else {
		instance_destroy(); 
		creator.alarm[1] = 1; 
		charCount = 0; 
	}
}