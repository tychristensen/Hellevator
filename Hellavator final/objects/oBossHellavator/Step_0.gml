/// @description Insert description here
// You can write your code in this editor

//stage0 pause
if (bossStage == 0){
	if (pauseCount == 0){
		y = oPlayer.y + random_range(-400, -500);
		x = oPlayer.x + random_range(-50, 50);
	}
	if (pauseCount < (100/speedMod)){
		pauseCount += 1;
	}
	else{
		pauseCount = 0;
		bossStage = round(random_range(1, 5));
	}
}
//stage1 attack, stomp
if (bossStage == 1){
	if(pauseCount == 0){
		y = oPlayer.y + random_range(-350, -450);
	}
	if (pauseCount < (30/speedMod)){
		y = oPlayer.y - 350;
		x = oPlayer.x
		pauseCount += 1;
	}
	else{
		y += (speedMod) * (attackCount+1) * 3;
	}	
}
//stage2 spawn creature
if (bossStage == 2){
	if (pauseCount == 0){
		x = oPlayer.x + random_range(-50, 50);
		y = oPlayer.y + random_range(-350, -450);
	}
	if (pauseCount < (30/speedMod)){
		x = x + random_range(-10, 10);
		pauseCount += 1;
	}
	else{
		instance_create_layer(x, y + 220, "Instances", oBlob);
		pauseCount = 0;
		bossStage = 0;
	}	
}
//stage 3 suck in player
if (bossStage == 4){
	if (pauseCount == 0){
		x = oPlayer.x + random_range(-50, 50);
		y = oPlayer.y + random_range(-400, -500);
	}
	if (pauseCount < (60/speedMod)){
		if (x < oPlayer.x){
			oPlayer.x -= (speedMod * 2);
		}
		if (x > oPlayer.x){
			oPlayer.x += (speedMod * 2);
		}
		//oPlayer.y -= speedMod * 3;
		pauseCount += 1;
	}
	else{
		bossStage = round(random_range(0, 5));
		pauseCount = 0;
	}	
}
//sweep stage
if (bossStage == 3){
	if (pauseCount < 150){
		x = oPlayer.x + random_range(-25, 25);
		y = oPlayer.y + random_range(-375, -425);
		pauseCount += 1;
	}
	if (pauseCount == 150){
		x = 780;
		y = 450;
		pauseCount = 151;
	}
	else if (x>51){
		x -= 4 + speedMod;
		pauseCount += 1;
	}
	else{
		bossStage = round(random_range(0, 5));
		pauseCount = 0;
	}	
}
if (bossStage == 5){
	bossStage = round(random_range(0, 4.5));
}
//death
if (healthVal == 0){
	global.isDead = 1; 
	instance_destroy();
}
if (x > 800){
	x = 800
}
if (x < 50){
	x = 50
}
show_debug_message("timer")
show_debug_message(pauseCount)
show_debug_message("attack")
show_debug_message(bossStage)
show_debug_message("weak")
show_debug_message(vulnerable)
