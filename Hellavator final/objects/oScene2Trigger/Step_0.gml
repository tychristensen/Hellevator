if (place_meeting(oScene2Trigger.x,oScene2Trigger.y,oPlayer)) {
	if (myTextbox == noone) {
		myTextbox = instance_create_layer(oScene2Trigger.x,oScene2Trigger.y,"Text",oTextboxScene2);
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
