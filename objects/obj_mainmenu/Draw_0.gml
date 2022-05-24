/// @draw menu
draw_sprite(spr_logo, 0, room_width/2, 96)

draw_set_font(fnt_mainmenu);
var fontheight = font_get_size(fnt_mainmenu);

draw_sprite(spr_menuhand, 0, x, y+(cursor_y*fontheight));

for(i = 0; i<=cursor_max; i++){
	draw_text(x+48, y+(i*fontheight), menu_options[i]);
}
