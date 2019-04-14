if (place_meeting(oScene1_1Trigger.x,oScene1_1Trigger.y,oPlayer)) {
	if (myTextbox == noone) {
		myTextbox = instance_create_layer(oScene1_1Trigger.x,oScene1_1Trigger.y,"Text",oTextboxScene1_1);
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
