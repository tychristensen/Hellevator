/// @description Scene 1 Dialog TextBox Test

// draw textbox
//draw_rectangle(oTextboxScene7.x- 2, oTextboxScene7.y - 2, oTextboxScene7.x + boxWidth + 2, oTextboxScene7.y + boxWidth + 2, false); 
draw_sprite(sbox, 0,oTextboxScene7.x,oTextboxScene7.y);

if ((page != 2) || (page != 3) || (page != 4)) {
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
draw_text(oTextboxScene7.x + (boxWidth/2) ,oTextboxScene7.y + yBuffer,name); 
draw_set_halign(fa_left);

// Draw part of the text
draw_set_color(c_white); 
draw_text_ext(oTextboxScene7.x + xBuffer ,oTextboxScene7.y + stringHeight + yBuffer,textPart,stringHeight,boxWidth - (2*xBuffer)); 


