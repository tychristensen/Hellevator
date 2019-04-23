/// @description Insert description here
// You can write your code in this editor
idle_move_chance = 4; //has 1 in 4 chance of moving every time the alarm goes off
alarm_set(0,30); //initial alarm set
moving = false; //whether the enemy is moving
move_direction = 1; //which direction the enemy moves
maxHorizontalSpeed = 3;//the speed at which the demon moves
horizontalSpeed = 0;
verticalSpeed = 0;
grav = .5;
attacking = false;
vulnerable = false;
pauseCount = 0;
healthVal = 3;
bossStage = 0;
bossPhase = 0;
attackCount = 0;
speedMod = .5;
global.isDead = 0; 
x = oPlayer.x;
y = oPlayer.y + 20;
