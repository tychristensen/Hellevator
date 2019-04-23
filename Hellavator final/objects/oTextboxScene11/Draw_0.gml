/// @description Scene 1 Dialog TextBox Test

// draw textbox
//draw_rectangle(oScene11Trigger.x- 2, oScene11Trigger.y - 2, oScene11Trigger.x + boxWidth + 2, oScene11Trigger.y + boxWidth + 2, false); 
draw_sprite(sbox, 0,oTextboxScene11.x,oTextboxScene11.y);

if ((page == 2) || (page == 4) || (page == 6) || (page == 10) || (page == 12) || (page == 14)) {
	// Uninterested Delilah
	draw_sprite(sMcShorthairReg,4,oPlayer.x + 225,oPlayer.y - 129);
} else if ((page == 0) || (page == 1)) {
	// Happy Hellavator 
	draw_sprite(sHellavatorTalkExcited,1,oPlayer.x + 225,oPlayer.y - 129);
} else {
	// Sad Hellavator 
	draw_sprite(sHellavatorTalkSad,2,oPlayer.x + 225,oPlayer.y - 129);
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
draw_text(oTextboxScene11.x + (boxWidth/2) ,oTextboxScene11.y + yBuffer,name); 
draw_set_halign(fa_left);

// Draw part of the text
draw_set_color(c_white); 
draw_text_ext(oTextboxScene11.x + xBuffer ,oTextboxScene11.y + stringHeight + yBuffer,textPart,stringHeight,boxWidth - (2*xBuffer)); 


