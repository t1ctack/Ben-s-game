if (global.pausado) exit;

if (!spawnando && inimigos_vivos <= 0) {

    onda += 1;

    if (onda mod 5 == 0) {

        var spawn_x = room_width / 2;
        var spawn_y = -50;

        instance_create_layer(spawn_x, spawn_y, "Entities", obj_boss);

        inimigos_vivos = 1;
        inimigos_para_spawnar = 0;

    } else {

        inimigos_para_spawnar = 5 + (onda * 2);
    }

    spawnando = true;
    alarm[0] = 60;

    mostrar_texto = true;
    tempo_texto = 120;
    escala_texto = 2;
}

if (mostrar_texto) {
    tempo_texto--;

    if (tempo_texto <= 0) {
        mostrar_texto = false;
    }
}

escala_texto = 2; // começa grande

if (mostrar_texto) {
    
    tempo_texto--;

    // animação diminuindo
    escala_texto = lerp(escala_texto, 1, 0.1);

    if (tempo_texto <= 0) {
        mostrar_texto = false;
    }
}