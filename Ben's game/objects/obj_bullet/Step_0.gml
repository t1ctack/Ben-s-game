if (global.pausado) {

    if (speed != 0) {
        velocidade_original = speed;
        speed = 0;
    }

    exit;
}

if (speed == 0 && velocidade_original > 0) {
    speed = velocidade_original;
}

// Movimento automático
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// Destruir se sair da tela
if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}

