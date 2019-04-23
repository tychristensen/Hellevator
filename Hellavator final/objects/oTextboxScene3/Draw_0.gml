/// @description Scene 1 Dialog TextBox Test

// draw textbox
//draw_rectangle(oTextboxScene3.x- 2, oTextboxScene3.y - 2, oTextboxScene3.x + boxWidth + 2, oTextboxScene3.y + boxWidth + 2, false); 
draw_sprite(sbox, 0,oTextboxScene3.x,oTextboxScene3.y);

draw_sprite(sHellavatorTalk,1,oPlayer.x + 225,oPlayer.y - 129);

// draw text 
draw_set_font(fnt_text); 

if (charCount < string_length(text[page])) {
	charCount += 0.5; 
} 

textPart = string_copy(text[page], 1, charCount);

// Draw the name 
draw_set_color(c_yellow); 
draw_set_halign(fa_center);
draw_text(oTextboxScene3.x + (boxWidth/2) ,oTextboxScene3.y + yBuffer,name); 
draw_set_halign(fa_left);

// Draw part of the text
draw_set_color(c_white); 
draw_text_ext(oTextboxScene3.x + xBuffer ,oTextboxScene3.y + stringHeight + yBuffer,textPart,stringHeight,boxWidth - (2*xBuffer)); 


