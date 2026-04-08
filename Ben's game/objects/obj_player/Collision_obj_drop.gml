switch (other.tipo) {

    case 0:
        vida += 1;
        if (vida > 3) vida = 3;
    break;

    case 1:
        velocidade_bonus = 2;
        tempo_velocidade = 180; // 3 segundos
    break;
	case 2:
		auto_tiro = true;
		// adiciono 4 usos de energia
		energia_uso += 4;
		tempo_auto_tiro = 180; // 3 segundos
	break;
}

with (other) {
    instance_destroy();
}