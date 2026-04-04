// sistema de pausa
global.pausado = false;

// música
if (!audio_is_playing(snd_music)) {
    musica = audio_play_sound(snd_music, 1, true);
}

// volume
volume_musica = 1;
audio_sound_gain(snd_music, volume_musica, 0);

// fullscreen
fullscreen = false;