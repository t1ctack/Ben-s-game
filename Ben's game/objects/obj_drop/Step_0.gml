// diminuo o tempo
tempo_vida--;

// quando faltar 10 segundos começa a piscar
if (tempo_vida <= room_speed * 10) {
    piscando = true;
}

// quando acabar o tempo, destruo
if (tempo_vida <= 0) {
    instance_destroy();
}