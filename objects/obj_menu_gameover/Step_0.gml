/// @description Insert description here
// You can write your code in this editor
if(can_input){
	if(input.key_up){
		cursorpos = 0;
	} else if (input.key_down){
		cursorpos = 1;
	}

	if(input.key_interact){
		if(cursorpos == 0){//Give Up? - YES
			room_goto(rm_mainmenu);
		} else { //Give Up? - No
			room_goto(rm_test);
			obj_game.player_hp = obj_game.player_maxhp;
		}
	}
}
