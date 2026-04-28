// ==========================
// PAUSA
// ==========================
if (global.pausado) exit;


// ==========================
// PEGAR ONDA ATUAL
// ==========================

var spawner = instance_find(obj_spawner, 0);

var onda_atual = 1;

if (spawner != noone) {
    onda_atual = spawner.onda;
}


// ==========================
// VELOCIDADE ESCALÁVEL
// ==========================

// velocidade base (mais lenta)
var spd_base = 1.2;

// aumento a cada 5 ondas
var aumento = floor(onda_atual / 5) * 0.5;

// velocidade final
var spd = spd_base + aumento;


// ==========================
// PEGAR PLAYER
// ==========================

var player = instance_nearest(x, y, obj_player);


// ==========================
// MOVIMENTO
// ==========================

if (player != noone) {

    // direção até o player
    var dir = point_direction(x, y, player.x, player.y);

    // movimento baseado na velocidade
    var h = lengthdir_x(spd, dir);
    var v = lengthdir_y(spd, dir);

    // aplico movimento
    x += h;
    y += v;


    // ==========================
    // TROCA DE SPRITE
    // ==========================

    if (abs(h) > abs(v)) {

        // horizontal
        if (h > 0) {
            sprite_index = spr_enemy_d;
        } else {
            sprite_index = spr_enemy_a;
        }

    } else {

        // vertical
        if (v > 0) {
            sprite_index = spr_enemy_s;
        } else {
            sprite_index = spr_enemy_w;
        }
    }

    // animação andando
    image_speed = 0.2;


    // ==========================
    // PARADO (ENCOSTOU NO PLAYER)
    // ==========================

    if (point_distance(x, y, player.x, player.y) < 5) {

        sprite_index = spr_enemy; // parado
        image_speed = 0;
    }
}