// chance de drop (30%)
if (irandom(100) < 30) {
    instance_create_layer(x, y, "Entities", obj_drop);
}