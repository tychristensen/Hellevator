if (place_meeting(oScene12_1Trigger.x,oScene12_1Trigger.y,oPlayer)) {
	if (myTextbox == noone) {
		myTextbox = instance_create_layer(oScene12_1Trigger.x,oScene12_1Trigger.y,"Text",oTextboxScene12_1);
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
