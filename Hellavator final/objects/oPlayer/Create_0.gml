/// @description Insert description here
// You can write your code in this editor

verticalSpeed = 0; //makes sure player isnt moving down 
horizontalSpeed = 0; //keeps player still
canJump = true; //tells whether player has jumped
grav = .5; //gravity constant
maxHorizontalSpeed = 8;//horizontal speed limiter
horizontalAcceleration = 1;
slow = .5;//horizontal "friction" constant
jumpSpeed = 15;
impactConstant = 12; //speed at which screen will shake if you hit the ground
bounceRatio = 5; //the amount the vertical speed is divided by when the player bounces