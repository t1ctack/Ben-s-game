// ==========================
// SISTEMA DE MORTE (PRIORIDADE MÁXIMA)
// ==========================

if (morto) {

    // clique para reiniciar ou sair
    if (mouse_check_button_pressed(mb_left)) {

        var mx = device_mouse_x_to_gui(0);
        var my = device_mouse_y_to_gui(0);

        var gui_w = display_get_gui_width();
        var gui_h = display_get_gui_height();

        // REINICIAR
        if (point_in_rectangle(mx, my, gui_w/2 - 100, gui_h/2 + 20, gui_w/2 + 100, gui_h/2 + 60)) {
            global.pausado = false;
            room_restart();
        }

        // SAIR
        if (point_in_rectangle(mx, my, gui_w/2 - 100, gui_h/2 + 80, gui_w/2 + 100, gui_h/2 + 120)) {
            global.no_menu = true;
            global.pausado = false;
            room_goto(rm_menu);
        }
    }

    exit; // PARA TODO O RESTO DO CÓDIGO
}


// ==========================
// SISTEMA DE PAUSA GLOBAL
// ==========================

// se estiver pausado eu paro tudo aqui
if (global.pausado) {
    exit;
}

// ==========================
// ATIVAR ENERGIA (TECLA E)
// ==========================

if (keyboard_check_pressed(ord("E"))) {

    if (energia_uso > 0 && !energia_ativa) {

        energia_uso--; // gasto 1 carga
        energia_ativa = true;

        energia_tiros_restantes = 5; // 5 sequências
        energia_delay = 0;
    }
}


// ==========================
// EXECUTAR TIRO AUTOMÁTICO
// ==========================

if (energia_ativa) {

    energia_delay--;

    if (energia_delay <= 0) {
		
		// toco o som uma vez por sequência
        audio_play_sound(snd_shoot, 1, false);

        // dispara em todas direções
        for (var i = 0; i < 360; i += 45) {

            var b = instance_create_layer(x, y, "Bullets", obj_bullet);
            b.direction = i;
        }

        energia_tiros_restantes--;

        energia_delay = 10; // tempo entre disparos

        if (energia_tiros_restantes <= 0) {
            energia_ativa = false;
        }
    }
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
// SPRITE DA ENERGIA (PRIORIDADE MÁXIMA)
// ==========================

if (energia_ativa) {

    sprite_index = spr_player_wasd;

    // velocidade da animação
    image_speed = 0.5;

    // não executa o resto das sprites
    exit;
}

if (!energia_ativa) {
    image_angle = 0;
}


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

    // eu crio a bala
    instance_create_layer(x, y, "Bullets", obj_bullet);

    // eu toco o som do tiro
    audio_play_sound(snd_shoot, 1, false);
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
// EFEITO DE DANO
// ==========================

if (efeito_dano > 0) {
    efeito_dano--;
}
