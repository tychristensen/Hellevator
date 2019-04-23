  /// @description Scene 1 Dialog TextBox Test

// draw textbox
//draw_rectangle(oPlayer.x - 2, oPlayer.y - 2, oPlayer.x + boxWidth + 2, oTextboxScene1_1.y + boxWidth + 2, false); 
tempx = oSceneJumpTutorialTrigger.x - 200;
tempy = oSceneJumpTutorialTrigger.y - 150;

draw_sprite(sbox, 0, tempx, tempy);

// draw text 
draw_set_font(fnt_text); 

if (charCount < string_length(text[page])) {
	charCount += 0.5; 
} 

textPart = string_copy(text[page], 1, charCount);

// Draw the name 
draw_set_color(c_yellow); 
draw_set_halign(fa_center);
draw_text(tempx + (boxWidth/2) , tempy + yBuffer,name); 
draw_set_halign(fa_left);

// Draw part of the text
draw_set_color(c_white); 
draw_text_ext(tempx + xBuffer , tempy + stringHeight + yBuffer,textPart,stringHeight,boxWidth - (2*xBuffer)); 


