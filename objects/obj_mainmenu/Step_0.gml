/// @Define Meu Function and Structure

switch(state){
	case MENU:
		if(input.key_uppressed) cursor_y--;
		if(input.key_downpressed) cursor_y++;
		
		if(cursor_y<0) cursor_y = 0;
		if(cursor_y>cursor_max) cursor_y = cursor_max;
		
		if(keyboard_check_pressed(vk_enter) || input.key_interact){
			switch(cursor_y){
				case 0://Continue
					break;
				case 1://New
					room_goto(rm_test);
					break;
				case 2://Load
					break;
				case 3://Settings
					break;
				case 4://Quit
					break;
			}
		}
		break;
}
