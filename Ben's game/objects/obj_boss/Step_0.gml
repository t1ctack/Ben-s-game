if (global.pausado) exit;

var player = instance_nearest(x, y, obj_player);

if (instance_exists(player)) {

    var dir = point_direction(x, y, player.x, player.y);

    // movimento
    x += lengthdir_x(velocidade, dir);
    y += lengthdir_y(velocidade, dir);
	
	if (!fase2 && vida <= vida_max / 2) {

    fase2 = true;

    velocidade = 2; // mais rápido
	}

    // ataque
    tempo_tiro--;

    if (tempo_tiro <= 0) {

        var espacamento = 45;

	if (fase2) {
		espacamento = 30; // mais tiros
	}

	for (var i = 0; i < 360; i += espacamento) {

		var b = instance_create_layer(x, y, "Bullets", obj_bullet_enemy);
		b.direction = i;
	}

        if (fase2) {
			tempo_tiro = 50;
		} else {
			tempo_tiro = 90;
		}
    }
}