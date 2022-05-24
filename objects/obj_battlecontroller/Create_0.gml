/// @Initialize battle controller, acts kind of like a tabletop Game Master. Accepts input, swaps states, executes commands, calculates reactions.
//state machine
//check obj_game for Macro Definitions
obj_game.game_state = BATTLE;
state = MAIN;

cursor_x = 0;
cursor_y = 0;

enemy_sprite = choose(spr_enemy_test, spr_enemy_test_cube, spr_enemy_test_weirdmonster);

enemy_hp = 1;

switch(enemy_sprite){
	case spr_enemy_test:
		enemy_hp = 10;
		break;
	case spr_enemy_test_cube:
		enemy_hp = 12;
		break;
	case spr_enemy_test_weirdmonster:
		enemy_hp = 8;
		break;
	
}

depth = -1000;

battle_text = "";
battle_text_linebump = 0;

player_attackmodifier = -10;
player_damagebonus = 3;
modifier_dir = 1;
