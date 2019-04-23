if (place_meeting(oScene13Trigger.x,oScene13Trigger.y,oPlayer)) {
	if (myTextbox == noone) {
		myTextbox = instance_create_layer(oScene13Trigger.x,oScene13Trigger.y,"Text",oTextboxScene13);
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
