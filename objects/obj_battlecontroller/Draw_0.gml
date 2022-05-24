/// @Draw Battle GUI
//Set Up variables for frame
var xx = camera_get_view_x(view_camera[0]);
var yy = camera_get_view_y(view_camera[0]);
var hud_x = xx;
var hud_y = yy;
var hudarrDeselect =  [spr_battleui_fight_deselected, spr_battleui_act_deselected, spr_battleui_item_deselected, spr_battleui_mercy_deselected];
var hudarrSelect =  [spr_battleui_fight_selected, spr_battleui_act_selected, spr_battleui_item_selected, spr_battleui_mercy_selected];
var button_gap = 16;

//Draw Background
draw_sprite(spr_battlescreen, 0, xx, yy);

//Draw Buttons [requires some clean up, hud_x and hud_y might need a name change for clarity, used to align FIGHT, ACT, ITEM, MERCY buttons]
var btn_x_start = xx+8;
var btn_y_start = yy+218;
for(i = 0; i<4; i++){
	draw_sprite(hudarrDeselect[i], 0, btn_x_start+(i*(64+button_gap)), btn_y_start);
}

//Draw Enemy Sprite
draw_sprite(enemy_sprite, 0, xx+160, yy+135);

//Draw Player Name and Level
	//Text has an offset
draw_set_colour(c_white);
draw_set_font(fnt_main);
draw_text(xx+6, yy+205, "GASTER LV - " + string(obj_game.player_level))

//Draw HP Bar
draw_sprite(spr_battleui_hpbar_backplate, 0, xx+144, yy+208);
draw_sprite_ext(spr_battleui_hpbar, 0, xx+168, yy+208, obj_game.player_hp/obj_game.player_maxhp, 1, 0, c_white, 1);

//Draw Battle GUI
switch(state){
	case MAIN:
		//hud_x = xx+8;
		//hud_y = yy+216;
		
		draw_sprite(spr_battleui_playertextbox, 0, xx, yy+136);
		
		//var hudarrDeselect =  [spr_battleui_fight_deselected, spr_battleui_act_deselected, spr_battleui_item_deselected, spr_battleui_mercy_deselected];
		var hudarrSelect =  [spr_battleui_fight_selected, spr_battleui_act_selected, spr_battleui_item_selected, spr_battleui_mercy_selected];

		draw_set_font(fnt_main);
		draw_set_colour(c_white);
		draw_text(xx, hud_y-16-(17*battle_text_linebump), battle_text);
		
		//draw_sprite(spr_heart, 0 , hud_x+(cursor_x*(64+button_gap)), hud_y-8);
		
		
		for(i = 0; i<4; i++){
			if(cursor_x == i) draw_sprite(hudarrSelect[i], 0, btn_x_start+(i*(64+button_gap)), btn_y_start);
		}
		break;
	case PLAYER_ATTACK:
		draw_sprite(spr_battleui_playerattack, -1, xx, yy+136);
		var token_distance = 304
		var token_x = (player_attackmodifier+10)/20 * token_distance;
		draw_sprite(spr_battleui_attackbar, -1, xx+8+token_x, yy+168);
		draw_sprite(spr_battleui_playerattack_frontplate, 0, xx, yy+136);
		break;
	case ENEMY_ATTACK:
		draw_set_colour(c_white);
		draw_rectangle(xx+114, yy+138, xx+204, yy+204, true)
		draw_rectangle(xx+115, yy+139, xx+205, yy+205, true)
		break;
	case ACT:
		hud_x = xx+24;
		hud_y = yy+160;
		var text_height = 16;
		draw_sprite(spr_battleui_playertextbox, 0, xx, yy+136);
		draw_set_font(fnt_main);
		draw_set_colour(c_white);
		draw_text(hud_x, hud_y, "PUT LIST OF ACTIONS HERE\nPRESS X TO GO BACK");
		break;
	case ITEM:
		hud_x = xx+24;
		hud_y = yy+160;
		var text_height = 16;
		draw_sprite(spr_battleui_playertextbox, 0, xx, yy+136);
		draw_set_font(fnt_main);
		draw_set_colour(c_white);
		draw_text(hud_x, hud_y, "PUT ITEM ARRAY HERE\nPRESS X TO GO BACK");
		break;
	case MERCY:
		hud_x = xx+24;
		hud_y = yy+160;
		var text_height = 16;
		draw_sprite(spr_battleui_playertextbox, 0, xx, yy+136);
		draw_sprite(spr_battleui_heart, 0 , hud_x, hud_y+(cursor_y*(text_height)));
		draw_set_font(fnt_main);
		draw_set_colour(c_white);
		draw_text(hud_x+16, hud_y, "SPARE");
		draw_text(hud_x+16, hud_y+text_height, "FLEE");
		break;
	case FLEE:
		hud_x = xx+24;
		hud_y = yy+160;
		var text_height = 16;
		draw_sprite(spr_battleui_playertextbox, 0, xx, yy+136);
		draw_set_font(fnt_main);
		draw_set_colour(c_white);
		draw_text(hud_x, hud_y, "GOT AWAY SAFELY");
		break;
	case WIN:
		hud_x = xx+24;
		hud_y = yy+160;
		var text_height = 16;
		draw_sprite(spr_battleui_playertextbox, 0, xx, yy+136);
		draw_set_font(fnt_main);
		draw_set_colour(c_white);
		draw_text(hud_x, hud_y, "YOU WIN");
		break;
	case LOSE:
		hud_x = xx+24;
		hud_y = yy+160;
		var text_height = 16;
		draw_sprite(spr_battleui_playertextbox, 0, xx, yy+136);
		draw_set_font(fnt_main);
		draw_set_colour(c_white);
		draw_text(hud_x, hud_y, "YOU LOSE");
		break;
}
