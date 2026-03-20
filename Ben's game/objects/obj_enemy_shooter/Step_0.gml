var player = instance_nearest(x, y, obj_player);

if (instance_exists(player)) {

    var dist = point_distance(x, y, player.x, player.y);
    var dir = point_direction(x, y, player.x, player.y);

    // manter distância do player
    if (dist > 200) {
        x += lengthdir_x(1.5, dir);
        y += lengthdir_y(1.5, dir);
    }

    // controle de tiro
    tempo_tiro--;

    if (tempo_tiro <= 0) {

        var b = instance_create_layer(x, y, "Entities", obj_bullet_enemy);
        b.direction = dir;

        tempo_tiro = 100;
    }
}