if (place_meeting(oScene10_3Trigger.x,oScene10_3Trigger.y,oPlayer)) {
	if (myTextbox == noone) {
		myTextbox = instance_create_layer(oScene10_3Trigger.x,oScene10_3Trigger.y,"Text",oTextboxScene10_3);
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
