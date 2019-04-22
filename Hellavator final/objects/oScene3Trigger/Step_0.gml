if (place_meeting(oScene3Trigger.x,oScene3Trigger.y,oPlayer)) {
	if (myTextbox == noone) {
		myTextbox = instance_create_layer(oScene3Trigger.x,oScene3Trigger.y,"Text",oTextboxScene3);
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
