// ==========================
// DETECTAR SE ESTOU NO MENU (COLOCA NO TOPO)
// ==========================

if (room == rm_menu) {
    global.no_menu = true;
} else {
    global.no_menu = false;
}

// ==========================
// BLOQUEAR PAUSE NO MENU
// ==========================

if (global.no_menu) {
    global.pausado = false;
}

// ==========================
// FULLSCREEN 
// ==========================
if (keyboard_check_pressed(vk_f11)) {
    fullscreen = !fullscreen;
    window_set_fullscreen(fullscreen);
}

// ==========================
// CONTROLE DE PAUSA
// ==========================

if (keyboard_check_pressed(vk_escape)) {

    // só funciona fora do menu
    if (!global.no_menu) {
        global.pausado = !global.pausado;
    }
}

// ==========================
// REINICIAR COM R
// ==========================

if (keyboard_check_pressed(ord("R"))) {

    // só funciona durante o jogo (não no menu)
    if (!global.no_menu) {
        global.pausado = false;
        room_restart();
    }
}

// ==========================
// CONTROLE DE VOLUME 
// ==========================

if (keyboard_check_pressed(vk_add)) {
    volume_musica += 0.1;
}

if (keyboard_check_pressed(vk_subtract)) {
    volume_musica -= 0.1;
}

if (keyboard_check_pressed(ord("M"))) {

    if (volume_musica > 0) {
        volume_musica = 0;
    } else {
        volume_musica = 1;
    }
}

volume_musica = clamp(volume_musica, 0, 1);
audio_sound_gain(snd_music, volume_musica, 0);

// ==========================
// BOTÕES DO PAUSE
// ==========================

if (global.pausado && mouse_check_button_pressed(mb_left)) {

    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();

    // continuar
    if (point_in_rectangle(mx, my, gui_w/2 - 100, gui_h/2 - 40, gui_w/2 + 100, gui_h/2)) {
        global.pausado = false;
    }

    // reiniciar
    if (point_in_rectangle(mx, my, gui_w/2 - 100, gui_h/2 + 20, gui_w/2 + 100, gui_h/2 + 60)) {
        room_restart();
    }

    // sair
    if (point_in_rectangle(mx, my, gui_w/2 - 100, gui_h/2 + 80, gui_w/2 + 100, gui_h/2 + 120)) {
        global.pausado = false;
        room_goto(rm_menu);
    }
}

// ==========================
// PAUSA GLOBAL
// ==========================

if (global.pausado) {
    exit;
}