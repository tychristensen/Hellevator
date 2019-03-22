/// @description Insert description here
// You can write your code in this editor
idle_move_chance = 20; //has 1 in 10 chance of moving every time the alarm goes off
alarm_set(0,30); //initial alarm set
moving = false; //whether the enemy is moving
move_direction = 1; //which direction the enemy moves
maxHorizontalSpeed = 3;//the speed at which the demon moves
horizontalSpeed = 0;
verticalSpeed = 0;
grav = .5;
attacking = false;
jumpSpeed = 15;