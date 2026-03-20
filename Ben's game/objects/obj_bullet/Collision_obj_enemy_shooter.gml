//Bala do player colide com inimigo
instance_create_layer(x, y, "Effects", obj_hit);

var spawner = instance_find(obj_spawner, 0);

if (spawner != noone) {
    spawner.inimigos_vivos--;
}

with (other) {
    instance_destroy();
}

instance_destroy();