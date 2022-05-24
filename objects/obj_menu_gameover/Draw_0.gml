/// @Draw Game Over Menu

draw_set_colour(c_white);
draw_set_font(fnt_main);
var text_height = 16;

draw_sprite(spr_battleui_heart, 0 , x, y+(cursorpos*(text_height)));
draw_text(x+16, y, "YES - RETURN TO MENU");
draw_text(x+16, y+text_height, "NO - CONTINUE");


draw_sprite_ext(spr_vfx_scanlines, 0, 0, 0, 1, 1, 0, c_white, 0.4);

