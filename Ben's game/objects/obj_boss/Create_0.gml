var spawner = instance_find(obj_spawner, 0);

if (spawner != noone) {
    vida_max = 20 + (spawner.onda * 10);
} else {
    vida_max = 20;
}

vida = vida_max;

velocidade = 1;
tempo_tiro = 60;

fase2 = false;
