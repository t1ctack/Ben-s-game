if (global.pausado) {

    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);

    draw_text(gui_w/2, gui_h/2 - 120, "PAUSADO");
    draw_text(gui_w/2, gui_h/2 - 20, "CONTINUAR");
    draw_text(gui_w/2, gui_h/2 + 40, "REINICIAR");
    draw_text(gui_w/2, gui_h/2 + 100, "SAIR");

    draw_text(gui_w/2, gui_h/2 + 160, "(M) Muta musica");
    draw_text(gui_w/2, gui_h/2 + 190, "(+) Aumenta volume");
    draw_text(gui_w/2, gui_h/2 + 220, "(-) Diminui volume");

    draw_text(gui_w/2, gui_h/2 + 260, "Volume: " + string(round(volume_musica * 100)) + "%");
}