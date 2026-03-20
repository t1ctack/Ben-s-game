//dano ao colidir com o inimigo
if (!invencivel) {
    vida -= 1;

	efeito_dano = 10;

	if (vida <= 0) {
		morto = true;
	}
	efeito_dano = 10; // duração do efeito

    invencivel = true;
    tempo_invencivel = 60; // 1 segundo de proteção
}