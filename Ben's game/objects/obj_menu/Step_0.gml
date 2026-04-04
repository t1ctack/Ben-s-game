var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

var gui_w = display_get_gui_width();

if (mouse_check_button_pressed(mb_left)) {

    // jogar
    if (point_in_rectangle(mx, my, gui_w/2 - 100, 280, gui_w/2 + 100, 320)) {

        global.no_menu = false;
        room_goto(rm_game);
    }

    // sair
    if (point_in_rectangle(mx, my, gui_w/2 - 100, 330, gui_w/2 + 100, 370)) {

        game_end();
    }
}