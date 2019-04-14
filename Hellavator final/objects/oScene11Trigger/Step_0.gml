if (place_meeting(oScene11Trigger.x,oScene11Trigger.y,oPlayer)) {
	if (myTextbox == noone) {
		myTextbox = instance_create_layer(oScene11Trigger.x,oScene11Trigger.y,"Text",oTextboxScene11);
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
