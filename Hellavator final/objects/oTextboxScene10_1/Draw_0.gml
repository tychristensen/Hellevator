/// @description Scene 1 Dialog TextBox Test

// draw textbox
//draw_rectangle(oTextboxScene10_1.x - 2, oTextboxScene10_1.y - 2, oTextboxScene10_1.x + boxWidth + 2, oTextboxScene10_1.y + boxWidth + 2, false); 
draw_sprite(sbox, 0,oTextboxScene10_1.x,oTextboxScene10_1.y);

if ((page == 1)) {
	// Hellavator 
	draw_sprite(sHellavatorTalk,1,oPlayer.x + 225,oPlayer.y - 129);
} else {
	// Delilah 
	draw_sprite(sMcShorthairReg,6,oPlayer.x + 225,oPlayer.y - 129);
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
draw_text(oTextboxScene10_1.x + (boxWidth/2) ,oTextboxScene10_1.y + yBuffer,name); 
draw_set_halign(fa_left);

// Draw part of the text
draw_set_color(c_white); 
draw_text_ext(oTextboxScene10_1.x + xBuffer ,oTextboxScene10_1.y + stringHeight + yBuffer,textPart,stringHeight,boxWidth - (2*xBuffer)); 


