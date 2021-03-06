/// @description Scene 1 Dialog TextBox Test

// draw textbox
//draw_rectangle(oTextboxScene8.x- 2, oTextboxScene8.y - 2, oTextboxScene8.x + boxWidth + 2, oTextboxScene8.y + boxWidth + 2, false); 
draw_sprite(sbox, 0,oTextboxScene8.x,oTextboxScene8.y);

// draw text 
draw_set_font(fnt_text); 

if (charCount < string_length(text[page])) {
	charCount += 0.5; 
} 

textPart = string_copy(text[page], 1, charCount);

// Draw the name 
draw_set_color(c_yellow); 
draw_set_halign(fa_center);
draw_text(oTextboxScene8.x + (boxWidth/2) ,oTextboxScene8.y + yBuffer,name); 
draw_set_halign(fa_left);

// Draw part of the text
draw_set_color(c_white); 
draw_text_ext(oTextboxScene8.x + xBuffer ,oTextboxScene8.y + stringHeight + yBuffer,textPart,stringHeight,boxWidth - (2*xBuffer)); 


