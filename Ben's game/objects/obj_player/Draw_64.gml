var spawner = instance_find(obj_spawner, 0);

// vida
for (var i = 0; i < vida; i++) {
    draw_sprite(spr_heart, 0, 20 + (i * 40), 20);
}

// HUD onda
if (spawner != noone) {
    draw_text(20, 70, "Onda: " + string(spawner.onda));
}

// texto grande animado
if (spawner != noone && spawner.mostrar_texto) {

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);

    var gui_w = display_get_gui_width();
	var gui_h = display_get_gui_height();

	draw_text_transformed(
		gui_w / 2,
		gui_h / 2,
        "ONDA " + string(spawner.onda),
        spawner.escala_texto,
        spawner.escala_texto,
        0
    );
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);

if (efeito_dano > 0) {

    draw_set_color(c_red);
    draw_set_alpha(0.3);

    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

    draw_set_alpha(1);
}

if (morto) {

    var gui_w = display_get_gui_width();
	var gui_h = display_get_gui_height();

	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
    draw_set_color(c_red);

    draw_text(gui_w / 2, gui_h / 2 - 40, "GAME OVER");

    draw_set_color(c_white);
    // botão reiniciar
	draw_text(gui_w/2, gui_h/2 + 40, "REINICIAR");

	// botão sair
	draw_text(gui_w/2, gui_h/2 + 100, "SAIR");
}

// ==========================
// HUD ENERGIA (CORRIGIDO)
// ==========================

if (energia_uso > 0) {

    // desenho só 1 sprite
    draw_sprite(spr_energia, 0, 20, 70);

    // texto roxo
    draw_set_color(make_color_rgb(150, 0, 255));

    draw_text(60, 70, string(energia_uso) + "x");

    // volta cor normal
    draw_set_color(c_white);
}

