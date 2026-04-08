var chance = irandom(100);

if (chance < 50) {
    tipo = 0; // vida (50%)
}
else if (chance < 85) {
    tipo = 1; // velocidade (35%)
}
else {
    tipo = 2; // tiro automático (15% - raro)
}

// tempo de vida (30 segundos)
tempo_vida = room_speed * 30;

// começa sem piscar
piscando = false;

