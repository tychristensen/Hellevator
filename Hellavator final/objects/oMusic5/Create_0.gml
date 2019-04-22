/// @description Insert description here
// You can write your code in this editor
audio_stop_sound(Heresy);
if (!audio_is_playing(Anger) and !audio_is_playing(AngerIntro)){
	audio_play_sound(AngerIntro, 1, false);
}