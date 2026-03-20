var spawner = instance_find(obj_spawner, 0);

if (spawner != noone) {
    vida_max = 50 + (spawner.onda * 10);
} else {
    vida_max = 50;
}

vida = vida_max;

velocidade = 1;
tempo_tiro = 60;

fase2 = false;
