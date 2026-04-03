global.pausado = false;
// toco a música em loop
// só toco a música se ela não estiver tocando
if (!audio_is_playing(snd_music)) {
    musica = audio_play_sound(snd_music, 1, true);
}

// volume da música
volume_musica = 1;

// aplico o volume
audio_sound_gain(snd_music, volume_musica, 0);