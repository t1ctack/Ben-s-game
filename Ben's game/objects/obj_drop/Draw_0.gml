// se estiver piscando
if (piscando) {

    // pisca mais rápido conforme o tempo acaba
    var velocidade_pisca = max(50, tempo_vida * 2);

    if (current_time mod velocidade_pisca < velocidade_pisca / 2) {
        draw_self();
    }

} else {
    draw_self();
}