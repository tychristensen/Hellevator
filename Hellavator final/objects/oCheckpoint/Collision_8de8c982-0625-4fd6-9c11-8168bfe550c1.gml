/// @description Activate checkpoint

image_index = 1;

if(global.checkpoint != noone && global.checkpoint != id && global.checkpointR == room) {
	global.checkpoint.image_index = 0;
}

global.checkpoint = id;
global.checkpointR = room;
global.checkpointX = x;
global.checkpointY = y;