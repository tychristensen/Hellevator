if (place_meeting(oScene1_2Trigger.x,oScene1_2Trigger.y,oPlayer)) {
	if (myTextbox == noone) {
		myTextbox = instance_create_layer(oScene1_2Trigger.x,oScene1_2Trigger.y,"Text",oTextboxScene1_2);
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
