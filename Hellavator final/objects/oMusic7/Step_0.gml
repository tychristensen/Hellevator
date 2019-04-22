/// @description Insert description here
// You can write your code in this editor
if (!audio_is_playing(LimboIntro) and intro_play and !audio_is_playing(Limbo)){
	intro_play = false;
	audio_play_sound(Limbo, 1, true);
}