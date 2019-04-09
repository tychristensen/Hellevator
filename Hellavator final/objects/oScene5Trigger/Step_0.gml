if (place_meeting(oScene5Trigger.x,oScene5Trigger.y,oPlayer)) {
	if (myTextbox == noone) {
		myTextbox = instance_create_layer(oScene5Trigger.x,oScene5Trigger.y,"Text",oTextboxScene5);
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
