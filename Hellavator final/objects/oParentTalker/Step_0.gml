if (place_meeting(oParentTalker.x,oParentTalker.y,oPlayer)) {
	if (myTextbox == noone) {
		myTextbox = instance_create_layer(oPlayer.x,oPlayer.y,"Text",oTextboxScene1);
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
