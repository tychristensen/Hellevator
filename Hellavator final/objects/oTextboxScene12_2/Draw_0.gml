/// @description Scene 1 Dialog TextBox Test

// draw textbox
draw_rectangle(oTextboxScene12_2.x - 2, oTextboxScene12_2.y - 2, oTextboxScene12_2.x + boxWidth + 2, oTextboxScene12_2.y + boxWidth + 2, false); 
draw_sprite(sbox, 0,oTextboxScene12_2.x,oTextboxScene12_2.y);

// draw text 
draw_set_font(fnt_text); 

if (charCount < string_length(text[page])) {
	charCount += 0.5; 
} 

textPart = string_copy(text[page], 1, charCount);

// Draw the name 
draw_set_color(c_yellow); 
draw_set_halign(fa_center);
draw_text(oTextboxScene12_2.x + (boxWidth/2) ,oTextboxScene12_2.y + yBuffer,name); 
draw_set_halign(fa_left);

// Draw part of the text
draw_set_color(c_white); 
draw_text_ext(oTextboxScene12_2.x + xBuffer ,oTextboxScene12_2.y + stringHeight + yBuffer,textPart,stringHeight,boxWidth - (2*xBuffer)); 


