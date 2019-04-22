/// @description Insert description here
// You can write your code in this editor
intro_play = true;
audio_stop_sound(Lust);
if (!audio_is_playing(Limbo) and !audio_is_playing(LimboIntro)){
	audio_play_sound(LimboIntro, 1, false);
}