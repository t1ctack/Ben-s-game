if (morto) exit;

var velocidade = 4 + velocidade_bonus;

var h = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var v = keyboard_check(ord("S")) - keyboard_check(ord("W"));

x += h * velocidade;
y += v * velocidade;

if (mouse_check_button_pressed(mb_left)) {
    instance_create_layer(x, y, "Bullets", obj_bullet);
}

//sistema de vida player
if (invencivel) {
    tempo_invencivel--;

    if (tempo_invencivel <= 0) {
        invencivel = false;
    }
}

//Mudar a opacidade do player ao levar dano
if (invencivel) {
    image_alpha = 0.5;
} else {
    image_alpha = 1;
}

//Bonus de velocidade
if (tempo_velocidade > 0) {
    tempo_velocidade--;
} else {
    velocidade_bonus = 0;
}

//tiro automatico bonus
if (auto_tiro) {

    tempo_auto_tiro--;

    if (tempo_auto_tiro <= 0) {
        auto_tiro = false;
    }

    // dispara em todas as direções a cada X frames
    if (current_time mod 200 < 16) {

        for (var i = 0; i < 360; i += 45) {

            var b = instance_create_layer(x, y,"Bullets", obj_bullet);
            b.direction = i;
        }
    }
}

if (efeito_dano > 0) {
    efeito_dano--;
}

if (morto && mouse_check_button_pressed(mb_left)) {

    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();

    if (point_in_rectangle(mx, my, gui_w/2 - 100, gui_h/2 + 20, gui_w/2 + 100, gui_h/2 + 60)) {
        room_restart();
    }
}