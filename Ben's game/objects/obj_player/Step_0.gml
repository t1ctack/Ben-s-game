// ==========================
// SISTEMA DE MORTE
// ==========================

// se eu morri, eu paro tudo e só deixo reiniciar
if (morto) {

    // detecto clique do mouse
    if (mouse_check_button_pressed(mb_left)) {

        var mx = device_mouse_x_to_gui(0);
        var my = device_mouse_y_to_gui(0);

        var gui_w = display_get_gui_width();
        var gui_h = display_get_gui_height();

        // se clicar no botão reiniciar
        if (point_in_rectangle(mx, my, gui_w/2 - 100, gui_h/2 + 20, gui_w/2 + 100, gui_h/2 + 60)) {
            room_restart();
        }
    }

    exit; // paro todo o resto do código
}


// ==========================
// SISTEMA DE PAUSA GLOBAL
// ==========================

// se estiver pausado eu paro tudo aqui
if (global.pausado) {
    exit;
}


// ==========================
// FULLSCREEN (F11)
// ==========================

// alterno fullscreen com F11
if (keyboard_check_pressed(vk_f11)) {
    fullscreen = !fullscreen;
    window_set_fullscreen(fullscreen);
}


// ==========================
// INPUT E MOVIMENTO
// ==========================

// defino velocidade com bonus
var velocidade = 4 + velocidade_bonus;

// pego input do teclado
var h = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var v = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// verifico se estou me movendo
var movendo = (h != 0 || v != 0);

// movo o player
x += h * velocidade;
y += v * velocidade;


// ==========================
// LIMITAR PLAYER (COM SPRITE)
// ==========================

var metade_largura = sprite_width / 2;
var metade_altura = sprite_height / 2;

// esquerda
if (x < metade_largura) {
    x = metade_largura;
}

// direita
if (x > room_width - metade_largura) {
    x = room_width - metade_largura;
}

// cima
if (y < metade_altura) {
    y = metade_altura;
}

// baixo
if (y > room_height - metade_altura) {
    y = room_height - metade_altura;
}


// ==========================
// DIREÇÃO
// ==========================

// atualizo direção baseado no movimento
if (h > 0) direcao = "right";
if (h < 0) direcao = "left";
if (v > 0) direcao = "down";
if (v < 0) direcao = "up";


// ==========================
// ANIMAÇÃO E SPRITES
// ==========================

if (movendo) {

    // andando
    switch (direcao) {

        case "down":
            sprite_index = spr_player_andando_s;
            break;

        case "up":
            sprite_index = spr_player_andando_w;
            break;

        case "right":
            sprite_index = spr_player_andando_d;
            break;

        case "left":
            sprite_index = spr_player_andando_a;
            break;
    }

    image_speed = 0.2;

} else {

    // parado
    if (mouse_check_button(mb_left)) {

        // atirando parado
        switch (direcao) {

            case "down":
                sprite_index = spr_player_atpd_s;
                break;

            case "up":
                sprite_index = spr_player_atpd_w;
                break;

            case "right":
                sprite_index = spr_player_atpd_d;
                break;

            case "left":
                sprite_index = spr_player_atpd_a;
                break;
        }

    } else {

        // parado normal
        switch (direcao) {

            case "down":
                sprite_index = spr_player;
                break;

            case "up":
                sprite_index = spr_player_costa;
                break;

            case "right":
                sprite_index = spr_player_direita;
                break;

            case "left":
                sprite_index = spr_player_esquerda;
                break;
        }
    }

    image_speed = 0;
    image_index = 0;
}


// ==========================
// TIRO NORMAL
// ==========================

// se clicar eu atiro
if (mouse_check_button_pressed(mb_left)) {
    instance_create_layer(x, y, "Bullets", obj_bullet);
}


// ==========================
// INVENCIBILIDADE
// ==========================

if (invencivel) {

    tempo_invencivel--;

    if (tempo_invencivel <= 0) {
        invencivel = false;
    }
}

// mudo opacidade quando invencível
if (invencivel) {
    image_alpha = 0.5;
} else {
    image_alpha = 1;
}


// ==========================
// BONUS DE VELOCIDADE
// ==========================

if (tempo_velocidade > 0) {
    tempo_velocidade--;
} else {
    velocidade_bonus = 0;
}


// ==========================
// TIRO AUTOMÁTICO
// ==========================

if (auto_tiro) {

    tempo_auto_tiro--;

    if (tempo_auto_tiro <= 0) {
        auto_tiro = false;
    }

    if (current_time mod 200 < 16) {

        for (var i = 0; i < 360; i += 45) {

            var b = instance_create_layer(x, y, "Bullets", obj_bullet);
            b.direction = i;
        }
    }
}


// ==========================
// EFEITO DE DANO
// ==========================

if (efeito_dano > 0) {
    efeito_dano--;
}