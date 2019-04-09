if (place_meeting(oScene10_2Trigger.x,oScene10_2Trigger.y,oPlayer)) {
	if (myTextbox == noone) {
		myTextbox = instance_create_layer(oScene10_2Trigger.x,oScene10_2Trigger.y,"Text",oTextboxScene10_2);
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
