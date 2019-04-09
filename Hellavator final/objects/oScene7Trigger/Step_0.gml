if (place_meeting(oScene7Trigger.x,oScene7Trigger.y,oPlayer)) {
	if (myTextbox == noone) {
		myTextbox = instance_create_layer(oScene7Trigger.x,oScene7Trigger.y,"Text",oTextboxScene7);
		myTextbox.text = myText; 
		myTextbox.creator = self; 
		myTextbox.name = myName; 
	}
} else {
	if (myTextbox != noone) {
		instance_destroy(myTextbox); 
		//myTextbox = noone; 
	}
}
