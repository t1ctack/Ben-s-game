var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

if (mouse_check_button_pressed(mb_left)) {

    // botão jogar
    if (point_in_rectangle(mx, my, room_width/2 - 100, 280, room_width/2 + 100, 320)) {
        room_goto(rm_game);
    }

    // botão sair
    if (point_in_rectangle(mx, my, room_width/2 - 100, 330, room_width/2 + 100, 370)) {
        game_end();
    }
}