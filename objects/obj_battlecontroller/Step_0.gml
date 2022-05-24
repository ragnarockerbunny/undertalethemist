/// @Manage Battle
var xx = camera_get_view_x(view_camera[0]);
var yy = camera_get_view_y(view_camera[0]);

switch(state){
	case MAIN:
		//Navigate Menu
		if(input.key_rightpressed) cursor_x++;
		if(cursor_x>3)cursor_x = 3;
		if(input.key_leftpressed) cursor_x--;
		if(cursor_x<0)cursor_x = 0;
		//Select Option
		if(input.key_interact){
			if(obj_game.player_hp<=0){
				state = LOSE;
			}
			if(enemy_hp<=0)instance_destroy();
			switch(cursor_x+1){
				case FIGHT:
					cursor_x = 0;
					cursor_y = 0;
					state = PLAYER_ATTACK;
					image_index = 0;
					player_attackmodifier = choose(7, 9);
					modifier_dir = choose(-1, 1);
					player_attackmodifier *= -modifier_dir;
					break;
				case ACT:
					cursor_x = 0;
					cursor_y = 0;
					state = ACT;
					break;
				case ITEM:
					cursor_x = 0;
					cursor_y = 0;
					state = ITEM;
					break;
				case MERCY:
					cursor_x = 0;
					cursor_y = 0;
					state = MERCY;
					break;
			}
		}
		break;
		case PLAYER_ATTACK:
			image_speed = 0.1;
			
			var modspeed = 0.3;
			player_attackmodifier+= modspeed *modifier_dir;
			if(abs(player_attackmodifier)>= 10){
				var fltnum = instance_create_depth(camera_get_view_x(view_camera[0]) + 160, camera_get_view_y(view_camera[0]) + 72, depth-1, obj_floating_number);
				fltnum.value = "MISS";
				state = ENEMY_ATTACK;
			}
			else if(input.key_interact){
				var _damage_dealt = obj_game.player_attack + ceil(player_damagebonus * ( ( (10-abs(player_attackmodifier)) /10 ) ));
				enemy_hp-= _damage_dealt;
				var fltnum = instance_create_depth(camera_get_view_x(view_camera[0]) + 160, camera_get_view_y(view_camera[0]) + 72, depth-1, obj_floating_number);
				var vfx = instance_create_depth(xx+160, yy+80, depth-10, obj_vfx);
				vfx.sprite_index = spr_vfx_attack;
				fltnum.value = _damage_dealt;
				if(enemy_hp<=0){
						state = WIN;
				}
				else{ 
					state = ENEMY_ATTACK;
					
				}
			}
			if(state == ENEMY_ATTACK){
				instance_create_depth(0, 0, depth-1, obj_battle_enemyattack);
				instance_create_depth(xx+160, yy+168, depth-1, obj_playerheart);
			}
			break;
		case ENEMY_ATTACK:
			if(obj_game.player_hp>0){
				if(!instance_exists(obj_battle_enemyattack)){
					state = MAIN;
				}
			}
			
			break;
		case ACT:
			if(input.key_interact){
				//DO SOMETHING
			}
			if(input.key_cancel){
				state = MAIN;
			}
			break;
		case ITEM:
			if(input.key_interact){
				//DO SOMETHING
			}
			if(input.key_cancel){
				state = MAIN;
			}
			break;
		case MERCY:
			if(input.key_downpressed) cursor_y++;
			if(cursor_y>1)cursor_y = 1;
			if(input.key_uppressed) cursor_y--;
			if(cursor_y<0)cursor_y = 0;
			
			if(input.key_interact){
				switch(cursor_y){
					case 0://SPARE
						break;
					case 1://FLEE
						state = FLEE;
						break;
				}
			}
			if(input.key_cancel){
				state = MAIN;
			}
			break;
		case FLEE:
			if(input.key_interact || input.key_cancel){
				instance_destroy();
			}
			break;
		case WIN:
			if(input.key_interact || input.key_cancel){
				instance_destroy();
			}
			break;
		case LOSE:
			if(input.key_interact || input.key_cancel){
				obj_game.player_hp = obj_game.player_maxhp;
				obj_game.game_state = ADVENTURE;
				room_goto(rm_game_over);
			}
			break;
}
