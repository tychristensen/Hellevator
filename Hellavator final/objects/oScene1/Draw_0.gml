/// @description Scene 1 Dialog TextBox Test

// draw textbox
draw_sprite(sbox, 0,oPlayer.x,oPlayer.y);

// draw text 
draw_set_font(fnt_text); 

draw_text_ext(oPlayer.x,oPlayer.y,text,stringHeight,boxWidth); 
