/// @description Scene 1 Dialog TextBox Test

// draw textbox
//draw_rectangle(oTextboxScene1_2.x - 2, oTextboxScene1_2.y - 2, oTextboxScene1_2.x + boxWidth + 2, oTextboxScene1_2.y + boxWidth + 2, false); 
draw_sprite(sbox, 0,oTextboxScene1_2.x,oTextboxScene1_2.y);

if ((page == 3) || (page == 5) || (page == 6) || (page == 10) || (page == 11) || (page == 13) || (page ==15) || (page == 17) || (page == 22) || (page == 24) || (page == 26) || (page == 27) || (page == 30) || (page == 31)) {
	// Hellavator 
	draw_sprite(sHellavatorTalk,1,oPlayer.x + 225,oPlayer.y - 129);
} else if ((page == 12) || (page == 14)) {
	// Scared Delilah 
	draw_sprite(sMcScared,1,oPlayer.x + 225,oPlayer.y - 129);
} else if ((page == 18) || (page == 19) || (page == 20) || (page == 21) || (page == 22) || (page == 23)) {
	// Smirking Delilah
	draw_sprite(sMcReg,2,oPlayer.x + 225,oPlayer.y - 129);
} else {
	// Delilah 
	draw_sprite(sMcReg,3,oPlayer.x + 225,oPlayer.y - 129);
}

// draw text 
draw_set_font(fnt_text); 

if (charCount < string_length(text[page])) {
	charCount += 0.5; 
} 

textPart = string_copy(text[page], 1, charCount);

// Draw the name 
draw_set_color(c_yellow); 
draw_set_halign(fa_center);
draw_text(oTextboxScene1_2.x + (boxWidth/2) ,oTextboxScene1_2.y + yBuffer,name); 
draw_set_halign(fa_left);

// Draw part of the text
draw_set_color(c_white); 
draw_text_ext(oTextboxScene1_2.x + xBuffer ,oTextboxScene1_2.y + stringHeight + yBuffer,textPart,stringHeight,boxWidth - (2*xBuffer)); 


