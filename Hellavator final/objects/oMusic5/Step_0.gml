/// @description Insert description here
// You can write your code in this editor
if (!audio_is_playing(AngerIntro) and !audio_is_playing(Anger)){
	intro_play = false;
	audio_play_sound(Anger, 1, true);
}