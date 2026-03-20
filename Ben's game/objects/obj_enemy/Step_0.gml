//Isso fara o inimigo ir até o player
var player = instance_nearest(x, y, obj_player);

if (player != noone) {
    var dir = point_direction(x, y, player.x, player.y);
    
    x += lengthdir_x(2, dir);
    y += lengthdir_y(2, dir);
}