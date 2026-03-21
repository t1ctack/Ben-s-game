// se o jogo estiver pausado
if (global.pausado) {

    // salvo velocidade atual e paro
    if (speed != 0) {
        velocidade_original = speed;
        speed = 0;
    }

    exit;
}

// se voltou do pause, restauro velocidade
if (speed == 0 && velocidade_original > 0) {
    speed = velocidade_original;
}

if (global.pausado) exit;

x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// destruir fora da tela
if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}