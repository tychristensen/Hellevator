/// @description Insert description here
// You can write your code in this editor

if(keyboard_check_pressed(ord("F"))) {
	if (page + 1 < array_length_1d(text)) {
		page += 1; 
		charCount = 0; 
		if ((page == 3) || (page == 5) || (page == 6) || (page == 10) || (page == 11) || (page == 13) || (page ==15) || (page == 17) || (page == 22) || (page == 24) || (page == 26) || (page == 27) || (page == 30) || (page == 31)) {
			name = "Hellavator";
		} else {
			name = "Delilah";  
		}
	} else {
		instance_destroy(); 
		creator.alarm[1] = 1; 
		charCount = 0; 
	}
}