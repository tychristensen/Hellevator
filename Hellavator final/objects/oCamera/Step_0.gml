/// @description Insert description here
// You can write your code in this editor

//these lines implement the tweening equation and screen shake.
//tween will cause the camera's center to lag slightly behind the players position when moving
//adding either global.shake or -global.shake will cause the screen to skae by that many pixels each frame
//the x and y of the camera object represent the center of the camera 
x+=(oPlayer.x-x)*tween+choose(global.shake,-global.shake)
y+=(oPlayer.y-y)*tween+choose(global.shake,-global.shake)


//these two variable establish the actual viewing cameras position. it will follow exactly the oCameras positon
//until the oCamera object gets close to the edge, so the actual view wont drift out of the room.

//cameraX and cameraY are just vaiables i use to clean up the code, they are only to plug these clamed values
//into camera_set_view_pos()
cameraX = clamp(x - (camera_get_view_width(view_camera[0]) div 2), 0, room_width - camera_get_view_width(view_camera[0]));
cameraY = clamp(y - (camera_get_view_height(view_camera[0]) div 2), 0, room_height - camera_get_view_height(view_camera[0]));

//sets the x and y of the GM camera to the clamped and limited values above.
camera_set_view_pos(view_camera[0],cameraX,cameraY);