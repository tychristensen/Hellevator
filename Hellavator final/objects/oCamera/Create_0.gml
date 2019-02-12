/// @description Insert description here
// You can write your code in this editor
global.shake = 0; // this variable controls how much the screen shakes every frame
window_set_fullscreen(true); //makes the game full screen
tween = .2 //this variable impacts the lag of the camera behind the player
view_camera[0] = camera_create_view(0,0,1024,768); //creates the camera for the panning view