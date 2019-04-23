/// @description Insert description here
// You can write your code in this editor
if (!audio_is_playing(TrechIntro) and !audio_is_playing(Trech)){
	intro_play = false;
	audio_play_sound(Trech, 1, true);
}