if (place_meeting(oScene12_2Trigger.x,oScene12_2Trigger.y,oPlayer)) {
	if (myTextbox == noone) {
		myTextbox = instance_create_layer(oScene12_2Trigger.x,oScene12_2Trigger.y,"Text",oTextboxScene12_2);
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
