if (place_meeting(x,y,oPlayer)) {
	if (myTextbox == noone) {
		myTextbox = instance_create_layer(x,y,"Text",oTextboxHint);
		myTextbox.text = myText; 
		myTextbox.creator = self; 
		myTextbox.name = myName; 
	}
} else {
	if (myTextbox != noone) {
		instance_destroy(myTextbox); 
		myTextbox = noone; 
	}
}
