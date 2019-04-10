/// @description Scene 1 Dialog TextBox Test

// draw textbox
// draw_rectangle(oTextboxScene14.x- 2, oTextboxScene14.y - 2, oTextboxScene14.x + boxWidth + 2, oTextboxScene14.y + boxWidth + 2, false); 
draw_sprite(sbox, 0,oTextboxScene14.x,oTextboxScene14.y);

// draw text 
draw_set_font(fnt_text); 

if (charCount < string_length(text[page])) {
	charCount += 0.5; 
} 

textPart = string_copy(text[page], 1, charCount);

// Draw the name 
draw_set_color(c_yellow); 
draw_set_halign(fa_center);
draw_text(oTextboxScene14.x + (boxWidth/2) ,oTextboxScene14.y + yBuffer,name); 
draw_set_halign(fa_left);

// Draw part of the text
draw_set_color(c_white); 
draw_text_ext(oTextboxScene14.x + xBuffer ,oTextboxScene14.y + stringHeight + yBuffer,textPart,stringHeight,boxWidth - (2*xBuffer)); 


