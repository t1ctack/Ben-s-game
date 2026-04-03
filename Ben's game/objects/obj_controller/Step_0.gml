if (keyboard_check_pressed(vk_escape)) {
    global.pausado = !global.pausado;
}

// ==========================
// CONTROLE DE VOLUME
// ==========================

// aumentar volume (tecla +)
if (keyboard_check_pressed(vk_add)) {
    volume_musica += 0.1;
}

// diminuir volume (tecla -)
if (keyboard_check_pressed(vk_subtract)) {
    volume_musica -= 0.1;
}

// limitar volume entre 0 e 1
volume_musica = clamp(volume_musica, 0, 1);

// aplicar volume
audio_sound_gain(snd_music, volume_musica, 0);

// mutar com M
if (keyboard_check_pressed(ord("M"))) {

    if (volume_musica > 0) {
        volume_musica = 0;
    } else {
        volume_musica = 1;
    }
}

// ==========================
// CONTROLE DE VOLUME (FUNCIONA NA PAUSA)
// ==========================

// aumentar volume (+)
if (keyboard_check_pressed(vk_add)) {
    volume_musica += 0.1;
}

// diminuir volume (-)
if (keyboard_check_pressed(vk_subtract)) {
    volume_musica -= 0.1;
}

// limitar entre 0 e 1
volume_musica = clamp(volume_musica, 0, 1);

// aplicar volume
audio_sound_gain(snd_music, volume_musica, 0);

// ==========================
// CLIQUE NO BOTÃO REINICIAR (PAUSA)
// ==========================

if (global.pausado && mouse_check_button_pressed(mb_left)) {

    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();

    // botão reiniciar
    if (point_in_rectangle(mx, my, gui_w/2 - 100, gui_h/2, gui_w/2 + 100, gui_h/2 + 40)) {
        room_restart();
    }
}


// ==========================
// SISTEMA DE PAUSA
// ==========================

if (global.pausado) {
    exit;
}