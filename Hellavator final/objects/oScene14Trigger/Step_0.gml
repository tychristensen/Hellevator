if (place_meeting(oScene14Trigger.x,oScene14Trigger.y,oPlayer)) {
	if (myTextbox == noone) {
		myTextbox = instance_create_layer(oScene14Trigger.x,oScene14Trigger.y,"Text",oTextboxScene14);
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
