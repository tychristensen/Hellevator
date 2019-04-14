/// @description Insert description here
// You can write your code in this editor

horizontalSpeed = 0;
verticalSpeed = 0;
y += 2;
bossPhase += 1;

if (bossStage == 1 && attackCount < 1){
	y = y - 250;
	x = oPlayer.x
	attackCount += 1;
}
else{
	bossStage = round(random_range(0, 4));
	pauseCount = 0;
	attackCount = 0;
}
