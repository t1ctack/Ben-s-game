// Código do evento de colisão entre obj_bullet e obj_boss

// Remove vida do boss
other.vida -= 1;

// Variável para efeito visual
efeito_dano = 10;

// Verifica se o boss morreu
if (other.vida <= 0) {
    other.morto = true;
    
    // Gerencia o spawner
    var spawner = instance_find(obj_spawner, 0);
    if (spawner != noone) {
        spawner.inimigos_vivos--;
    }
    
    // Destroi o boss
    with (other) {
        instance_destroy();
    }
}

// Cria efeito de hit
instance_create_layer(x, y, "Effects", obj_hit);

// Destroi a bala
instance_destroy();