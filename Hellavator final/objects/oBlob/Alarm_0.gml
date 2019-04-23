	/// @description Insert description here
// You can write your code in this editor
does_move=irandom(idle_move_chance-1);
//this code below seems counter intuitive but if does move = 0 then it moves becuase
//the random selection has a 1/idle_move_chance to choose 0.
if(does_move == 0 && attacking = false)
{
	move_direction = choose(-1,1);
	horizontalSpeed = maxHorizontalSpeed*move_direction;
	alarm_set(1,30) //this alarm dictates the stopping of the demon
}
alarm_set(0,30);