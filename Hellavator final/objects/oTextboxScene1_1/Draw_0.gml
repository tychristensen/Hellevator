 /// @description Scene 1 Dialog TextBox Test

// draw textbox
//draw_rectangle(oPlayer.x - 2, oPlayer.y - 2, oPlayer.x + boxWidth + 2, oTextboxScene1_1.y + boxWidth + 2, false); 
draw_sprite(sbox, 0,oPlayer.x,oPlayer.y);
draw_sprite(sMcReg,3,oPlayer.x + 250,oPlayer.y - 129);

// draw text 
draw_set_font(fnt_text); 

if (charCount < string_length(text[page])) {
	charCount += 0.5; 
} 

textPart = string_copy(text[page], 1, charCount);

// Draw the name 
draw_set_color(c_yellow); 
draw_set_halign(fa_center);
draw_text(oPlayer.x + (boxWidth/2) ,oPlayer.y + yBuffer,name); 
draw_set_halign(fa_left);

// Draw part of the text
draw_set_color(c_white); 
draw_text_ext(oPlayer.x + xBuffer ,oPlayer.y + stringHeight + yBuffer,textPart,stringHeight,boxWidth - (2*xBuffer)); 


