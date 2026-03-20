if (spawnando) {

    if (inimigos_para_spawnar > 0) {

        var lado = irandom(3);

var spawn_x;
var spawn_y;

switch (lado) {

    case 0: // topo
        spawn_x = random(room_width);
        spawn_y = -20;
    break;

    case 1: // baixo
        spawn_x = random(room_width);
        spawn_y = room_height + 20;
    break;

    case 2: // esquerda
        spawn_x = -20;
        spawn_y = random(room_height);
    break;

    case 3: // direita
        spawn_x = room_width + 20;
        spawn_y = random(room_height);
    break;
}

        var tipo = irandom(100);

        if (tipo < 70) {
            instance_create_layer(spawn_x, spawn_y, "Entities", obj_enemy);
        } else {
            instance_create_layer(spawn_x, spawn_y, "Entities", obj_enemy_shooter);
        }

        inimigos_para_spawnar--;
        inimigos_vivos++;

        alarm[0] = 20; //faz rodar mais de uma vez

    } else {
        spawnando = false;
    }
}